module Snippets
  # Reusable coaching box HTML code, e.g. for zettelkasten.de/coaching/
  def coaching_box
    <<HTML
<aside class="coaching__tldr">
  <h2 class="skip-toc">Zettelkasten Coaching in&nbsp;a&nbsp;Nutshell</h2>
  <ul>
    <li>Learn from a decade of experience and dedication</li>
    <li>Live 1-on-1 video chat</li>
    <li>80 EUR (US$95) per hour</li>
  </ul>
  <div class="coaching__action-container">
    #{coaching_email_request(text: "Send Me an E-Mail", classes: "coaching__action")}
  </div>
</aside>
HTML
  end

  # Output a meta-tag for use in your site header. The key you supply is looked
  # up in the configuration under 'meta_data'. You can override it on a per-item
  # basis.
  #
  # Usage:
  #
  #   <%= meta_tag :keywords %>
  #
  # This will output:
  #
  #   <meta name="keywords" value="...">
  #
  # Here, '...' is either the value of @item[:keywords] or that of
  # @config[:keywords].
  #
  # via https://github.com/avdgaag/nanoc-template
  def meta_tag(key)
    value = @item[key] || @config[:meta_data][key]
    if key == :author && value[0] == "@" && author_full_name = item[:author_full_name]
      value = %Q{#{author_full_name} (#{value})}
    end
    if key == :description && @item[:kind] == 'article' && value == @config[:meta_data][key]
      value = Post::description_for(@item)
    end
    return '<meta name="%s" content="%s">' % [key, value] if value
  end

  def extract_identifiers(route)
    regex = /(?<parent>.*\/)(?<ident>[@\w\d\.\-_\s]+\/)$/

    return route[regex, :ident], route[regex, :parent]
  end
end
