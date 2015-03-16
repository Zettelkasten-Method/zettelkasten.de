require "date"
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
        if Post::is_imported?(item)
          return "christiantietze"
        end
        
        "zettelkastende"
      end
    end
    
    module Post
      class << self
        include My::Blog::Post
      end
      
      def is_imported?(item)
        item[:import]
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
          return %Q{by Marko Wenzel}
        end
        
        author_name = author.capitalize
        %Q{by <a href="/authors/#{author}/" rel="author">#{author_name}</a>}
      end
      
      def contact_tag_for(item)
        author = item[:author] || 'christian'
        
        if author == "Marko Wenzel"
          return ""
        end
        
        gplus = case author
                when 'sascha' then 'https://plus.google.com/107502518870533837270'
                else 'https://plus.google.com/102954263645795828102/'
                end
        twitter = case author
                  when 'sascha' then 'saschafast'
                  else 'ctietze'
                  end
        
        %Q{&bull; <a href="#{gplus}">Google+</a>, <a href="https://www.twitter.com/#{twitter}">Twitter</a>}
      end
      
      def teaser_path_for(item)
        return unless item[:image]
      
        filename = item[:image]
        image_name = File::basename(filename, File::extname(filename))
        thumbnail = image_name + '-thumbnail' + File::extname(filename)
        
        '/img/blog/' + thumbnail
      end
      
      def teaser_for(item)
        path = teaser_path_for(item)
        return unless path
        
        href = item.path
      
        %Q{<figure class="post-teaser"><a href="#{href}"><img src="#{path}" alt="Teaser image" class="post-teaser__image"/></a></figure>}
      end
      
      def teaser_open_graph_for(item, site)
        path = Post::teaser_path_for(item)
        return unless path
        
        %Q{<meta name="og:image" content="#{site.config[:base_url] + path}">}
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
    end
    
    def latest_post(kind = "article")
      posts(kind)[-1]
    end
    
    def posts(kind = "article")
      @site.items.select { |item| item[:kind] == kind }
    end
    
    def tags(kind = "article")
      posts = sorted_posts(kind)
      tags = Set.new
      
      posts.each do |post|
        post[:tags].each do |tag|
          tags.add(tag)
        end unless post[:tags].nil?
      end
      
      return tags.to_a.sort
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
    
    def comments_allowed_for(item)
      return false if item[:comments].nil?
      return false if item[:comments] == "off"
      return false unless item[:comments]
      return true
    end
    
    def rel_link_to(text, file)
      raise "file expected" unless file
      raise "text expected" unless text
      
      href = relative_path_for(file, @item)
      
      %Q{<a href="#{href}">#{text}</a>}
    end
    
    def rel_url_for(file)
      relative_path_for file, @item
    end
    
    def teaser_image_path
      '/img/blog/' + @item[:image]
    end
    
    def insert_teaser_image(title: "", caption: "", link: nil)
      insert_rel_image(file: teaser_image_path(), 
                   title: title,
                   caption: caption,
                   link: link)
    end
    
    def insert_rel_image(file: nil, title: "", caption: "", link: nil, relative: nil)
      insert_rel_image(file: rel_url_for(file), 
                   title: title, 
                   caption: caption, 
                   link: link, 
                   relative: relative)
    end
    
    def insert_rel_image(file: nil, title: "", caption: "", link: nil, relative: nil)
      raise "file expected" unless file
      
      href = link || unless relative.nil?
                       relative_path_for relative, @item
                     else
                       file
                     end
      
      figcaption = %Q{<figcaption class="post-figure__caption">#{caption}</figcaption>} if caption
      
      %Q{<figure class="post-figure"><a href="#{href}"><img alt="#{title}" src="#{file}" class="post-figure__image"/></a>#{figcaption}</figure>}
    end
    
    def excerpt_for(item)
      if !use_excerpt?(item)
        return item.compiled_content
      end
    
      # html = Nokogiri::HTML(item.compiled_content)
      # paragraphs = html.xpath('//p/text()').to_a
      # 
      # summary = paragraphs[0]
      html = Nokogiri::HTML::DocumentFragment.parse(item.compiled_content)
      summary = ""
      
      html.css('p').each do |p, index|
        p.css("a").each do |a|
          a.remove if a['href'].start_with?('#fn:')
        end
        summary << p.inner_html + " "
        break if summary.length > 300 
      end
      
      %Q{<p class="summary">#{summary}</p><p class="readmore"><a class="readmore__link" href="#{item.path}">Continue reading...</a></p>}
    end
    
    private
      def use_excerpt?(item)
        preview_excerpt = (item[:preview] == nil || item[:preview] != 'fulltext')
        return !is_link_post?(item) && preview_excerpt
      end
    
      def is_link_post?(item)
        is_link_post = (item[:url] != nil)
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