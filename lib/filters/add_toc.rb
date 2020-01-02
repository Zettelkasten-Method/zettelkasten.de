#https://github.com/nanoc/nanoc.ws/blob/master/lib/filters/add_toc.rb
class NokogiriTOC
  def self.level_text
    [@level["h2"], @level["h3"], @level["h4"]].join(".").gsub(/\.0/, "")
  end

  def self.run(html, options = {})
    options[:content_selector] ||= "body"

    doc = Nokogiri::HTML(html)
    toc_data = []

    @level = {"h2" => 0, "h3" => 0, "h4" => 0}
    selector = @level.keys.map{|h| Nokogiri::CSS.xpath_for("#{options[:content_selector]} #{h}")}.join("|")

    current_heading = nil

    doc.xpath(selector).each do |node|
      current_heading = node.name
      @level[node.name] += 1

      @level["h3"] = 0 if node.name == "h2"
      @level["h4"] = 0 if node.name == "h2" || node.name == "h3"

      data = {:title => node.content, :link => '#' + node['id'], :children => []}

      parent = case node.name
                 when "h2" then toc_data
                 when "h3" then toc_data.last[:children]
                 when "h4" then toc_data.last[:children].last[:children]
               end
      parent << data
    end

    toc = doc.create_element("ol")
    build_toc(toc, toc_data)

    toc.to_html
  end

  def self.build_toc(toc, data)
    data.each do |item|
      li = toc.document.create_element("li")
      li.add_child(li.document.create_element("a", item[:title], :href => item[:link]))
      unless item[:children].empty?
        build_toc(li.add_child(li.document.create_element("ol")), item[:children])
      end
      toc.add_child(li)
    end
    toc
  end
end

module NanocSite
  class AddTOCFilter < Nanoc::Filter

    identifier :add_toc

    def run(content, params={})
      content.gsub(/\{\{(TOC|toc)\}\}/) do
        toc = NokogiriTOC.run(content)

        res = '<details class="toc" open="open">'
        res << '<summary>Table of Contents</summary>'
        res << toc
        res << '</details>'

        res
      end
    end
  end
end
