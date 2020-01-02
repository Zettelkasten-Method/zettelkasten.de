require "redcarpet"
require 'rouge'
require 'rouge/plugins/redcarpet'

# https://github.com/robin850/jekyll/blob/master/lib/jekyll/converters/markdown.rb
class RedcarpetRougeRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
  include Redcarpet::Render::SmartyPants

  def add_code_tags(code, lang)
    code = code.to_s
    code = code.sub(
      %r!<pre>!,
      "<pre><code class=\"language-#{lang}\" data-lang=\"#{lang}\">"
    )
    code = code.sub(%r!</pre>!, "</code></pre>")
    code
  end

  def block_code(code, lang)
    lang ||= 'text'
    code = "<pre>#{super}</pre>"

    "<div class=\"highlight\">#{add_code_tags(code, lang)}</div>"
  end
end
