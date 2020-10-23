module Menu
  private
  FORUM_URL = "https://forum.zettelkasten.de"
  # The :key is a MainMenuItem#key, the lowercased symbol form with underscores instead of spaces
  SUBMENUS = {
#    blog: [
#      { title: "Recent Posts", link: "/" },
#      { title: "Overview",     link: "/posts/overview/" },
#      { title: "Blog Archive",      link: "/posts/" }
#    ]
  }
  MAIN_MENU = [
    { title: "Blog",            link: "/",                icon: "folder" },
    { title: "Getting Started", link: "/posts/overview/", icon: "folder" },
    { title: "Coaching",        link: "/coaching/",       icon: "easel" },
    { title: "Software",        link: "/the-archive/",    icon: "thearchive" },
    { title: "Online Course",   link: "/course/",         icon: "easel" },
    { title: "Forum",           link: FORUM_URL,          icon: "people" },
  ]

  def main_menu_items
    @@main_menu_items ||= MAIN_MENU.map { MainMenuItem.new(**_1) }
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
    if current_path = @item_rep&.path and menu_item.submenu_includes_path?(current_path)
      "<span class=\"active\">#{text}</span>"
    else
      link_to_unless_current(text, menu_item.link)
    end
  end

  private

  class MenuItem
    attr_reader :title, :link, :icon

    def initialize(title:, link:, icon: nil)
      @title, @link, @icon = title, link, icon
    end

    def key
      # "Foo bar" -> :foo_bar
      title.downcase.gsub(" ", "_").to_sym
    end
  end

  class MainMenuItem < MenuItem
    def html(renderer:)
      classes = [].tap do |classes|
        classes << "menu_item"
        classes << "l-grid-2 m-grid-6 s-grid-12"
        classes << "menu-item--has-submenu" if !submenu.nil?
      end.join(" ")

      icon_html = %Q{<img class="iconic iconic-sm nav__icon" data-src="/img/#{icon}.svg" width="16">} if !icon.nil?
      icon_html ||= ""

      return "".tap do |output|
        output << %Q{<li class="#{classes}">}
        output << renderer.link_to_unless_root_of_hierarchy(%Q{#{icon_html} #{title}}, self)
        output << rendered_submenu(renderer: renderer)
        output << %Q{</li>}
      end
    end

    def submenu
      SUBMENUS[key]
    end

    def has_submenu?
      !submenu.nil?
    end

    def submenu_includes_path?(path)
      return false unless has_submenu?
      return submenu.map { _1[:link] }.include?(path)
    end

    def rendered_submenu(renderer:)
      return "" unless has_submenu?
      submenu_html = submenu
                       .map { SubMenuItem.new(**_1) }
                       .map { _1.html(renderer: renderer) }
                       .join()
      return "".tap do |output|
        output << %Q{<ul class="sub-navigation s-grid-whole m-grid-whole l-grid-whole">}
        output << submenu_html
        output << %Q{</ul>}
      end
    end
  end

  class SubMenuItem < MenuItem
    def html(renderer:)
      return "".tap do |output|
        output << %Q{<li class="l-grid-2 m-grid-12 s-grid-12">}
        output << renderer.link_to_unless_current(title, link)
        output << %Q{</a>}
        output << %Q{</li>}
      end
    end
  end
end
