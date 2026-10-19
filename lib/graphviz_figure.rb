# frozen_string_literal: true

require "base64"
require "cgi"
require "digest"
require "open3"
require "tmpdir"

# Renders GraphViz sources to standalone SVGs in the site's house style.
#
# Stock-and-flow edges labelled "+" or "-" are drawn as reinforcing (blue)
# or balancing (rose, dashed) links. PT Sans is embedded as a glyph subset,
# so the figure renders identically inside <img> where page fonts don't apply.
# Rendering requires graphviz (dot, gvpr), fonttools (pyftsubset), and macOS's PT Sans.
module GraphvizFigure
  FENCE = /^```dot[ \t]*\n(.*?)^```[ \t]*$/m

  INK = "#333333"
  MUTED = "#6b6560"
  FRAME = "#144659"
  CLUSTER_FILL = "#e9e2d9"
  REINFORCING = "#4961DD"
  BALANCING = "#b4505c"

  # Graphviz color names used in sources, mapped to house tokens.
  PALETTE = {
    "lightgrey" => CLUSTER_FILL,
    "blue" => REINFORCING,
  }.freeze

  PT_SANS = "/System/Library/Fonts/Supplemental/PTSans.ttc"
  PT_SANS_FACES = { "normal" => 0, "bold" => 7 }.freeze

  DEFAULTS = %W[
    -Gbgcolor=transparent -Gpad=0.15 -Gnodesep=0.3 -Granksep=0.5
    -Gfontname=PT\ Sans -Gfontsize=16 -Gfontcolor=#{MUTED}
    -Nfontname=PT\ Sans -Nfontsize=18 -Nfontcolor=#{INK}
    -Ncolor=#{FRAME} -Nstyle=filled -Nfillcolor=white -Npenwidth=1.2
    -Efontname=PT\ Sans\ Bold -Efontsize=21 -Ecolor=#{INK}
    -Epenwidth=1.3 -Earrowsize=0.7
  ].freeze

  module_function

  def sources(markdown)
    markdown.scan(FENCE).flatten
  end

  def filename(source)
    "graphviz-#{Digest::SHA256.hexdigest(source)[0, 12]}.svg"
  end

  # Appends an ERB figure call after every ```dot fence; run before the :erb filter.
  def with_figures(markdown)
    markdown.gsub(FENCE) do |fence|
      %(#{fence}\n\n<%= insert_relative_image file: "./#{filename($1)}", title: "Diagram rendered from the GraphViz code above" %>)
    end
  end

  # Makes sure every ```dot fence in a post has its SVG item next to it.
  # Renders missing SVGs into the post folder and prunes orphaned ones, unless
  # deploying, where a missing SVG is an error: render locally and commit it.
  def prepare(items, deploying:)
    items.find_all("/posts/**/*.md").group_by { |post| File.dirname(post[:content_filename]) }.each do |dir, posts|
      wanted = posts.flat_map { |post| sources(post.raw_content) }.to_h { |source| [filename(source), source] }
      folder = File.dirname(posts.first.identifier.to_s)

      unless deploying
        (Dir.children(dir).grep(/\Agraphviz-\h{12}\.svg\z/) - wanted.keys).each do |orphan|
          File.delete(File.join(dir, orphan))
          items.delete_if { |item| item.identifier == File.join(folder, orphan) }
        end
      end

      next if wanted.empty?
      unless posts.all? { |post| %w[index.md de.md].include?(File.basename(post[:content_filename])) }
        raise "#{dir}: posts with ```dot fences need their own folder (…/<slug>/index.md)"
      end

      wanted.each do |name, source|
        identifier = File.join(folder, name)
        next if items[identifier]

        path = File.join(dir, name)
        raise "#{path} is missing: compile locally to render it, then commit it" if deploying

        File.write(path, render(source))
        items.create(File.expand_path(path), {}, identifier, binary: true)
      end
    end
  end

  def render(source)
    styled = run("gvpr", "-c", gvpr_program, stdin: source)
    svg = run("dot", "-Tsvg", *DEFAULTS, stdin: styled)
      .sub(/\A.*?(?=<svg)/m, "")
      .gsub(/<!--.*?-->\n?/m, "")
      .gsub(/<title>[^<]*<\/title>\n?/, "")
      .gsub(/font-family="PT Sans Bold"/, 'font-family="PT Sans" font-weight="bold"')
      .gsub(/font-family="[^"]*"/, 'font-family="PT Sans, sans-serif"')

    faces = Dir.mktmpdir do |dir|
      texts_by_weight(svg).map { |weight, text| font_face(weight, text.chars.uniq.join, dir) }
    end
    svg.sub(/(<svg[^>]*>)/) { "#{$1}\n<style>#{faces.join}</style>" }
  end

  def gvpr_program
    remap = PALETTE.map { |name, hex| %(if ($.ATTR == "#{name}") $.ATTR = "#{hex}";) }.join(" ")
    per_object = %w[color fillcolor fontcolor].map { |attr| remap.gsub("ATTR", attr) }.join(" ")
    <<~GVPR
      BEG_G {
        graph_t sg;
        for (sg = fstsubg($G); sg; sg = nxtsubg(sg)) {
          #{per_object.gsub("$.", "sg.")}
        }
      }
      N { #{per_object} }
      E { #{per_object} }
      E [label == "+"] { color = "#{REINFORCING}"; fontcolor = "#{REINFORCING}"; }
      E [label == "-"] { label = "−"; color = "#{BALANCING}"; fontcolor = "#{BALANCING}"; style = "dashed"; }
    GVPR
  end

  def run(*cmd, stdin: nil)
    out, err, status = Open3.capture3(*cmd, stdin_data: stdin)
    raise "#{cmd.first} failed:\n#{err}" unless status.success?
    out
  end

  def font_face(weight, text, dir)
    subset = File.join(dir, "pt-sans-#{weight}.woff")
    run("pyftsubset", PT_SANS, "--font-number=#{PT_SANS_FACES.fetch(weight)}",
        "--text=#{text}", "--flavor=woff", "--output-file=#{subset}")
    data = Base64.strict_encode64(File.binread(subset))
    %(@font-face{font-family:"PT Sans";font-weight:#{weight};src:url(data:font/woff;base64,#{data}) format("woff")})
  end

  def texts_by_weight(svg)
    svg.scan(/<text([^>]*)>([^<]*)<\/text>/).each_with_object(Hash.new { |h, k| h[k] = +"" }) do |(attrs, body), acc|
      weight = attrs.include?('font-weight="bold"') ? "bold" : "normal"
      acc[weight] << CGI.unescapeHTML(body)
    end
  end
end
