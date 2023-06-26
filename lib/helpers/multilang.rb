module MultiLang
  public
  def item_lang(item = nil)
    item ||= @item
    lang = item[:lang] unless item.nil?
    lang ||= @config[:meta_data][:lang]
    lang.to_sym
  end

  def item_translations(item, skip_current: true)
    @items.select { _1[:canonical] == item[:canonical] && !(skip_current && @item == _1) }
  end

  # Metadata links
  # TODO: rename to meta-link sth sth
  def render_language_links
    translations = item_translations(@item, skip_current: true)
    return "" if translations.nil?
    translations
      .map { |i| %Q{<link hreflang="#{item_lang(i)}" rel="alternate" href="#{i.path}">} }
      .join
  end

  ALL_LANGS = {
    :en => "English",
    :zh => "Chinese", # TODO: translate to Chinese
    :de => "Deutsch",
  }

  def link_to_lang_unless_current(item)
    lang = item_lang(item)
    raise "Language not found: '#{lang}'" if ALL_LANGS[lang].nil?
    link_to_unless_current(ALL_LANGS[lang], item, lang: lang.to_s, hreflang: lang.to_s)
  end

  # Hyperlinks to click
  def language_links(item = nil)
    item ||= @item
    language_links = item_translations(item, skip_current: false)
                       .sort { _1[:lang] <=> _2[:lang] }
                       .map { |other_item| link_to_lang_unless_current(other_item) }
    language_links.join(" ")  # .join(" &bull; ")
  end

  # Text to show in front of alternative language selectors.
  LANGUAGE_ANNOUNCEMENTS = {
    :en => "Read in these languages",
    :de => "In diesen Sprachen lesen",
    :zh => "Read in these languages", # TODO: translate to Chinese
  }

  def language_announcement(item = nil)
    item ||= @item
    LANGUAGE_ANNOUNCEMENTS[item_lang(item).to_sym]
  end

  NO_COMMENTS_TEXT = {
    :en => %{Comments are in English and <a href="https://forum.zettelkasten.de/">powered by our forum.</a>},
    :de => %{Kommentare sind auf Englisch <a href="https://forum.zettelkasten.de/">in unserem Forum.</a>},
    :zh => %{Comments are in English and <a href="https://forum.zettelkasten.de/">powered by our forum.</a>}, # TODO: translate to Chinese
  }

  def canonical_comment_link()
    return [
      "<hr/>",
      NO_COMMENTS_TEXT[item_lang] || "",
    ].join("\n")
  end
end
