module MultiLang
  public
  def item_lang(item = nil)
    item ||= @item
    lang = item[:lang] unless item.nil?
    lang ||= @config[:meta_data][:lang]
    lang.to_sym
  end

  def item_translations(item, skip_current: true)
    items_with_same_canonical = @items
                                  .select { !(_1[:canonical].nil?) && _1[:canonical] == item[:canonical] && !(skip_current && @item == _1) }
                                  # .map { { lang: item_lang(_1), href: _1.path } }
    items_with_same_canonical
  end

  def alternate_item_translations(item)
    return [] if item[:alternate].nil?
    return [] if item[:alternate].is_a?(String)
    item[:alternate]
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
    language_links = [].tap do |all|
      all << item_translations(item, skip_current: false)
               .map { { link: link_to_lang_unless_current(_1), lang: _1[:lang].to_s } }
      all << alternate_item_translations(item)
               .map { { link: link_to(ALL_LANGS[_1[:lang].to_sym] + " " + external_link_text(item), _1[:href], lang: _1[:lang].to_s, hreflang: _1[:lang].to_s, class: "extern"), lang: _1[:lang].to_s } }
    end.flatten
    language_links
      .sort { _1[:lang] <=> _2[:lang] }
      .map { _1[:link] }
      .join(" ")  # .join(" &bull; ")
  end

  # Text to show in front of alternative language selectors.
  LANGUAGE_ANNOUNCEMENTS = {
    :en => "Read in these languages",
    :de => "In diesen Sprachen lesen",
    :zh => "Read in these languages", # TODO: translate to Chinese
  }

  def language_announcement(item = nil)
    item ||= @item
    LANGUAGE_ANNOUNCEMENTS[item_lang(item)]
  end

  EXTERN_TEXT = {
    :en => "(extern)",
    :de => "(extern)",
    :zh => "(extern)"
  }

  def external_link_text(item = nil)
    item ||= @item
    EXTERN_TEXT[item_lang(item)]
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

  # TODO: make My:Blog use use_helper API, remove that method from there, then this can be uncommented:
  # def canonical_path(item = nil)
    # item ||= @item
    # item[:canonical] || item.path
  # end
end
