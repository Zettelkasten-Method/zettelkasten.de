module Menu
  private
  FORUM_URL = "https://forum.zettelkasten.de"
  # The :key is a MainMenuItem#id, the lowercased symbol form with underscores instead of spaces
  SUBMENUS = {
    thearchive: [
      { id: :thearchive_main,  title: "Overview",   path: "/the-archive/" },
      { id: :help,             title: "Help",       path: "/the-archive/help/" },
      { id: :plugins,          title: "Plug-Ins",   path: "/the-archive/plug-ins/" },
      { id: :roadmap,          title: "Roadmap",    path: "/the-archive/roadmap/" },
    ]
  }

  MAIN_MENU_PER_LANG = {
    :en => [
      { id: :overview,    title: "Getting Started",  path: "/overview/",       icon: "compass" },
      { id: :thearchive,  title: "The Archive",      path: "/the-archive/",    icon: "thearchive" },
      { id: :course,      title: "Workshop",         path: "/course/",         icon: "monitor" },
      { id: :coaching,    title: "Coaching",         path: "/coaching/",       icon: "easel" },
      { id: :members,     title: "Members Area",     path: "/members-area/",   icon: "lock-locked" },
      { id: :forum,       title: "Forum",            url: FORUM_URL,           icon: "people" },
      { id: :blog,        title: "Blog",             path: "/posts/",          icon: "folder" },
    ],
    :de => [
      { id: :overview,    title: "Getting Started",  path: "/overview/",       icon: "compass" },
      { id: :thearchive,  title: "The Archive",      path: "/the-archive/",    icon: "thearchive" },
      { id: :course,      title: "Workshop",         path: "/course/",         icon: "monitor" },
      { id: :coaching,    title: "Coaching",         path: "/coaching/",       icon: "easel" },
      { id: :members,     title: "Members Area",     path: "/members-area/",   icon: "lock-locked" },
      { id: :forum,       title: "Forum",            url: FORUM_URL,           icon: "people" },
      { id: :blog,        title: "Blog",             path: "/de/posts/",       icon: "folder" },
    ]
  }

  def link_to_homepage
    case item_lang
    when :en
      %{<a class="header__link" href="/">Zettelkasten</a>}
    when :de
      %{<a class="header__link" href="/">Zettelkasten</a>} # 2024-08-27: new landing page, not yet in German
    else
      %{<a class="header__link" href="/">Zettelkasten</a>}
    end
  end

  def main_menu_items
    @@main_menu_items ||= {}
    # Try to generate the menu per language; fall back to English (default).
    @@main_menu_items[item_lang] ||= (MAIN_MENU_PER_LANG[item_lang] || MAIN_MENU_PER_LANG[:en]).map { MainMenuItem.new(**_1) }
  end

  public

  def render_menu_items
    main_menu_items
      .map { _1.html(renderer: self) }
      .join()
  end

  def item_has_submenu?
    current_path = @item_rep&.path
    return false if current_path.nil?
    main_menu_items
      .select { _1.has_submenu? }
      .select { _1.submenu_includes_path?(current_path) }
      .empty? == false
  end

  def link_to_unless_root_of_hierarchy(text, menu_item)
    if menu_item.submenu_includes_path?(@item_rep&.path)
      %Q{<span class="active">#{text}</span>}
    # elsif path.to_s.start_with?(menu_item.link)
    #   %Q{<span class="active">#{link_to_unless_current(text, menu_item.link)}</span>}
    else
      link_to_unless_current(text, menu_item.link)
    end
  end

  private

  class MenuItem
    attr_reader :id, :title, :icon
    attr_reader :path, :url

    def initialize(id:, title:, path: nil, url: nil, icon: nil)
      @id, @title, @path, @url, @icon = id, title, path, url, icon
    end

    def link_kind
      return :path if !@path.nil?
      return :url if !@url.nil?
      return :none
    end

    def rendered_link(renderer:)
      icon_html = if !icon.nil?
                    if icon.include?(".")
                      icon_image(icon)
                    else
                      iconic(icon)
                    end
                  else
                    ""
                  end

      label = %Q{#{icon_html}#{title}}

      case link_kind
      when :url
        renderer.link_to(label, @url)
      when :path
        renderer.link_to_unless_current(label, @path)
      else
        label
      end
    end
  end

  class MainMenuItem < MenuItem
    def html(renderer:)
      classes = [].tap do |classes|
        classes << "menu_item"
        classes << "menu-item--has-submenu" if has_submenu?
      end.join(" ")

      return "".tap do |output|
        output << %Q{<li class="#{classes}">}
        output << rendered_link(renderer: renderer)
        output << rendered_submenu(renderer: renderer)
        output << %Q{</li>}
      end
    end

    def icon_image(file)
      %Q{<img class="iconic iconic-sm nav__icon" src="/img/#{file}" width="16">}
    end

    def iconic(name)
      %Q{<span aria-hidden="true" class="iconic" data-glyph="#{icon}"></span>} + " " # Trailing space here
    end

    def submenu
      SUBMENUS[@id]
    end

    def has_submenu?
      !submenu.nil?
    end

    def submenu_includes_path?(path)
      return false unless has_submenu?
      return false unless path
      return submenu.map { _1[:link] }.include?(path)
    end

    def rendered_submenu(renderer:)
      return "" unless has_submenu?
      submenu_html = submenu
                       .map { SubMenuItem.new(**_1) }
                       .map { _1.html(renderer: renderer) }
                       .join()
      return "".tap do |output|
        output << %Q{<ul class="sub-navigation">}
        output << submenu_html
        output << %Q{</ul>}
      end
    end
  end

  class SubMenuItem < MenuItem
    def html(renderer:)
      return "".tap do |output|
        output << %Q{<li class="sub-menu_item">}
        output << rendered_link(renderer: renderer)
        output << %Q{</a>}
        output << %Q{</li>}
      end
    end
  end
end
