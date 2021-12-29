require "date"
require "time"
require 'set'
require "active_support/inflector"
require "nokogiri"

module My
  module Blog
    module Tag
      class << self
        include My::Blog::Tag
      end

      def link_to(tag_name)
        %Q{<a href="/posts/tags/#{tag_name}/">#{tag_name}</a>}
      end
    end

    module Comments
      class << self
        include My::Blog::Comments
      end

      def title_for(item)
        item[:title].gsub(/'/, '')
      end

      def identifier_for(item)
        item.path
      end

      def shortname_for(item)
        if Post::is_imported?(item) && Post::had_comments?(item)
          return "christiantietze"
        end

        "zettelkastende"
      end
    end

    module Post
      class << self
        include My::Blog::Post
      end

      def is_fulltext?(item)
        item[:preview] && item[:preview] == "fulltext"
      end

      def comments_allowed_for(item)
        return true if item[:comments].nil?
        return false if item[:comments] == "off" or item[:comments] == false
        return true
      end

      def comment_link_for(item)
        href = item.path + '#comments'
        link_to("Comments", href, "vanilla-identifier" => Comments::identifier_for(item))
      end

      def is_imported?(item)
        item[:import]
      end

      def had_comments?(item)
        !had_no_comments?(item)
      end

      def had_no_comments?(item)
        item[:import][:without_comments]
      end

      def imported_from(item)
        item[:import][:from]
      end

      def imported_to(item)
        item.path
      end

      def date_for(item)
        throw "item '#{item.path}' has no creation date" unless item[:created_at]

        date = parsed_time(item[:created_at])

        date.strftime "%b #{ActiveSupport::Inflector.ordinalize(date.day)}, %Y"
      end

      def tags_for(item)
        template = <<-Template
        <ul class="tags">
        <% tags.each do |tag| %>
          <li><%= Tag::link_to(tag) %></li>
        <% end %>
        </ul>
        Template

        erb = ERB.new template
        tags = item[:tags] || []

        erb.result(binding)
      end

      def origin_of(item)
        %Q{originally appeared on <a href="http://christiantietze.de/">christiantietze.de</a>}
      end

      def time_tag_for(item)
        %Q{<time datetime="#{item[:created_at]}">#{My::Blog::Post::date_for(item)}</time>}
      end

      def author_tag_for(item)
        author = item[:author] || 'christian'

        if author == "Marko Wenzel"
          return %Q{by <a href="https://twitter.com/mrkwnzl/">Marko Wenzel</a>}
        elsif author == "Peter Buyze"
          return %Q{by DutchPete}
        elsif author == "Erik Pfeiffer"
          return "by Erik Pfeiffer"
        elsif author == "Nick"
          return "by Nick"
        end

        if author[0] == "@"
          return %Q{by <a href="https://forum.zettelkasten.de/profile/#{author[1...]}">#{author}</a>}
        end

        author_name = author.capitalize
        %Q{by <a href="/authors/#{author}/" rel="author">#{author_name}</a>}
      end

      def contact_tag_for(item)
        author = item[:author] || 'christian'

        # Guest bloggers
        case author
        when 'sascha' then return ""
        when 'christian' then return %Q{&bull; <a href="https://www.twitter.com/ctietze">Twitter</a>}
        when "Peter Buyze" then return %Q{&bull; <a href="https://plus.google.com/+PeterBuyze">Google+</a>}
        when "Marko Wenzel", "Erik Pfeiffer", "Nick" then return ""
        end

        if author[0] == "@"
          return %Q{&bull; <a href="https://forum.zettelkasten.de/profile/#{author[1...]}">Forum profile</a>}
        end

        return ""
      end

      def translator_tag_for(item)
        return "" if item[:translators].nil?

        "&bull; Translated by " + item[:translators].map { |t| %Q{<a rel="translator" href="#{t[:website]}">#{t[:name]}</a>} }.join(", ")
      end

      def teaser_path_for(item)
        if not item[:rel_image].nil?
          rel_url_for(item[:rel_image], item)
        elsif not item[:image].nil?
          filename = item[:image]
          image_name = File::basename(filename, File::extname(filename))
          thumbnail = image_name + '-thumbnail' + File::extname(filename)
          '/img/blog/' + thumbnail
        end
      end

      def teaser_for(item)
        return unless use_excerpt?(item)

        path = teaser_path_for(item)
        return unless path

        href = item.path

        %Q{<figure class="post-teaser"><a href="#{href}"><img src="#{path}" alt="Teaser image" class="post-teaser__image"/></a></figure>}
      end

      def teaser_open_graph_for(item, config)
        path = Post::teaser_path_for(item)
        return unless path

        %Q{<meta name="og:image" content="#{config[:base_url] + path}">}
      end

      def tom_pixel_for(item)
        return unless item[:vgwort]

        vgwort_src = item[:vgwort]

        %Q{<img src="#{vgwort_src}" width="1" height="1" alt="" class="vgwort" />}
      end

      def post_title_link_for(item)
        if is_link_post?(item)
          return link_to(item[:title], item[:url])
        end

        return link_to(item[:title], item.path)
      end

      def post_class_for(item)
        [].tap { |classes|
          classes << "post--link" if is_link_post?(item)
        }.join(' ')
      end

      def year_month(item)
        date = DateTime.parse(item[:created_at].to_s)
        return { year: date.year, month: date.month }
      end
    end

    module Page
      class << self
        include My::Blog::Page
      end

      def page_class_for(item)
        [].tap { |classes|
          classes << "page--attributed" if is_attributed?(item)
        }.join(' ')
      end
    end

    def latest_post(kind = "article")
      posts(kind)[-1]
    end

    def posts(kind = "article")
      @items.select { |item| item[:kind] == kind }
    end

    def tags(kind = "article")
      tags_mtimes = {}
      posts(kind).each do |post|
        mtime = attribute_to_time(post[:updated_at] || post[:created_at])
        (post[:tags] || []).each do |tag|
          tags_mtimes[tag] = [tags_mtimes[tag] || mtime, mtime].max
        end
      end
      return tags_mtimes
    end

    def partitioned_by_year(posts)
      years_data, months_data = posts

      ym_posts = posts.group_by { |p| Post::year_month(p) }
      years = {}
      ym_posts.each do |date, posts|
        # before: {{year, month} => [posts]}
        # after: {year => {month => [posts]}}
        (years[date[:year]] ||= {})[date[:month]] = posts
      end
      years
    end

    def partitioned_sorted_posts_by_year(kind = "article")
      partitioned_by_year(sorted_posts(kind))
    end

    class Month
      attr_reader :year, :month

      def initialize(args)
        @year = args[:year]
        @month = args[:month]
      end

      def title
        Date.new(@year, @month).strftime('%b')
      end

      def first_day
        Date.new(@year, @month, 1).iso8601
      end

      def last_day
        Date.new(@year, @month, -1).iso8601
      end

      def padded
        "%02d" % @month
      end

      def post_url
        "/posts/#{year}/#{padded}"
      end
    end

    def years_and_months(posts)
      # year-to-mtime (last post modification date)
      years = {}
      months = {}

      posts.each do |post|
        date = DateTime.parse(post[:created_at].to_s)
        mtime = attribute_to_time(post[:updated_at] || post[:created_at])
        ym = { year: date.year, month: date.month }
        years[date.year] = [years[date.year] || mtime, mtime].max
        months[ym] = [months[ym] || mtime, mtime].max
      end

      return years, months
    end

    def sorted_posts(kind = "article")
      posts(kind).sort_by do |post|
        attribute_to_time(post[:created_at])
      end.reverse
    end

    def sorted_posts_by(author, kind = "article")
      sorted_posts(kind).select { |post| post[:author] == author }
    end

    def paginated_posts(items_per_page = 10, kind = "article")
      sorted_posts.each_slice(items_per_page - 1).to_a
    end

    def link_to_posts_page(text, page, items_per_page, kind = "article")
      return if page < 1 || paginated_posts(items_per_page)[page - 1].nil?

      %Q{<a href="/posts/pages/#{page}/">#{text}</a>}
    end

    def posts_tagged_with(tags, kind = "article")
      tags = tags.split(',') if tags.is_a?(String)

      sorted_posts(kind).select do |item|
        item_tags = item[:tags] || []
        overlap   = item_tags & tags

        not overlap.empty?
      end
    end

    def posts_between_dates(from, to, kind = "article")
      from_time = parsed_time(from)
      to_time = parsed_time(to)

      sorted_posts(kind).select do |item|
        item_time = parsed_time(item[:created_at])

        (item_time.to_i >= from_time.to_i) && (item_time.to_i < to_time.to_i)
      end
    end

    def parsed_time(time)
      if time.kind_of?(Time)
        return time.clone
      end

      Time.parse(time.to_s)
    end

    def rel_link_to(text, file)
      raise "file expected" unless file
      raise "text expected" unless text

      href = relative_path_for(file, @item)

      %Q{<a href="#{href}">#{text}</a>}
    end

    def rel_url_for(file, item=nil)
      relative_path_for file, item || @item
    end

    def insert_teaser_image(title: "", caption: "", link: nil, border: true)
      teaser_image_path = if !@item[:image].nil?
                            '/img/blog/' + @item[:image]
                          elsif !@item[:rel_image].nil?
                            rel_url_for(@item[:rel_image])
                          end
      return unless teaser_image_path

      insert_image(file: teaser_image_path,
                   title: title,
                   caption: caption,
                   link: link,
                   border: border)
    end

    def insert_image_group(urls: [], caption: "", border: true)
      raise "urls must not be empty" if urls.empty?

      border_class = (border == true) ? "" : "post-figure--borderless"
      rendered_image_links = urls.map { |url|
        %Q{<a href="#{url}" class="post_figure--grid__item"><img src="#{url}" class="post-figure__image"></a>}
      }.join("\n")
      rendered_caption = if caption.empty?
                           ""
                         else
                           %Q{<figcaption class="post-figure__caption">#{caption}</figcaption>}
                         end
      return [
        %Q{<figure class="post-figure post-figure--grid #{border_class}">},
          %Q{<div class="post-figure__images">},
            rendered_image_links,
          %Q{</div>},
          rendered_caption,
        %Q{</figure>}
      ].join("\n")
    end

    def insert_rel_image(file: nil, title: "", caption: "", link: nil, relative: nil, border: true)
      insert_relative_image(file: file, title: title, caption: caption, link: link, relative: relative, border: border)
    end

    def insert_relative_image(file: nil, title: "", caption: "", link: nil, relative: nil, border: true)
      insert_image(file: rel_url_for(file), title: title, caption: caption, link: link, relative: relative, border: border)
    end

    def insert_image(file: nil, title: "", caption: "", link: nil, relative: nil, border: true)
      raise "file expected" unless file

      href = link
      href ||= if relative.nil?
                 file
               else
                 relative_path_for relative, @item
               end

      figcaption = %Q{<figcaption class="post-figure__caption">#{caption}</figcaption>} if caption

      border_class = (border == true) ? "" : "post-figure--borderless"
      %Q{<figure class="post-figure #{border_class}"><a href="#{href}"><img alt="#{title}" src="#{file}" class="post-figure__image"/></a>#{figcaption}</figure>}
    end

    def insert_youtube(id, caption: nil)
      raise "youtube video id expected" unless id && !id.to_s.empty?
      figcaption = %Q{<figcaption class="post-figure__caption">#{caption}</figcaption>} if caption
      %Q{<figure class="post-figure youtube"><div class="video-container"><iframe src="https://www.youtube-nocookie.com/embed/#{id}" frameborder="0" allowfullscreen></iframe></div>#{figcaption}</figure>}
    end

    def fulltext_for(item)
      item.compiled_content(snapshot: :pre)
    end

    def excerpt_for(item)
      if !use_excerpt?(item)
        return fulltext_for(item)
      end

      summary = ""

      if not item[:excerpt].nil?
        summary = item[:excerpt]
      else
        html = Nokogiri::HTML::DocumentFragment.parse(fulltext_for(item))

        html.css('p, li').each do |p, index|
          p.css("a").each do |a|
            a.remove if a['href'].start_with?('#fn:')
          end
          summary << p.inner_html + " "
          break if summary.length > 300
        end
      end

      %Q{<p class="summary">#{summary}</p><p class="readmore"><a class="readmore__link" href="#{item.path}">Continue reading...</a></p>}
    end

    private
      def use_excerpt?(item)
        preview_excerpt = !Post::is_fulltext?(item)
        return !is_link_post?(item) && preview_excerpt
      end

      def is_link_post?(item)
        item[:url].nil? == false
      end

      def is_attributed?(item)
        item[:author].nil? == false
      end

      def relative_path_for(filename, item)
        File.join(item.path, filename)
      end

      def attribute_to_time(time)
        time = Time.local(time.year, time.month, time.day) if time.is_a?(Date)
        time = Time.parse(time) if time.is_a?(String)
        time
      end
  end
end
