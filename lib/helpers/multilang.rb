module MultiLang
  public
  def render_language_links
    return "" if @item[:languages].nil?
    @item[:languages]
      # Skip own language
      .select { |lang, _| lang.to_s != item_lang.to_s }
      .map { |lang, href| %Q{<link hreflang="#{lang}" rel="alternate" href="#{href}">} }
      .join
  end

  def item_lang
    @item[:lang] || @config[:meta_data][:lang]
  end
end
