require 'yaml'

module Menu
  private

  def self.menu_config
    @@menu_config ||= YAML.safe_load_file(
      File.expand_path('../../menu.yaml', __dir__),
      symbolize_names: true
    )
  end

  def self.forum_url
    menu_config[:forum_url]
  end

  def self.submenus
    @@submenus ||= menu_config[:submenus]
  end

  def self.main_menu_per_lang
    @@main_menu_per_lang_config ||= menu_config[:main_menu].transform_values do |items|
      items.map do |item|
        item[:url] == "forum" ? item.merge(url: forum_url) : item
      end
    end
  end

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
    @@main_menu_items[item_lang] ||= (Menu.main_menu_per_lang[item_lang] || Menu.main_menu_per_lang[:en]).map { MainMenuItem.new(**_1) }
  end

  public

  def render_menu_items
    main_menu_items
      .map { _1.html(renderer: self) }
      .join()
  end

  private

  class MenuItem
    attr_reader :id, :title, :icon
    attr_reader :path, :url

    def initialize(id:, title:, path: nil, url: nil, icon: nil)
      @id, @title, @path, @url, @icon = id, title, path, url, icon
    end

    def submenu
      Menu.submenus[@id.to_sym]
    end

    def has_submenu?
      !submenu.nil?
    end

    def submenu_id
      nil unless has_submenu?
      %Q{#{@id.to_s}_submenu}
    end

    def link_kind
      return :path if !@path.nil?
      return :url if !@url.nil?
      return :none
    end

    def is_active?(renderer:)
      is_current?(renderer: renderer)
    end

    def is_current?(renderer:)
      return false unless link_kind == :path

      current_path = renderer.item_rep&.path
      return false if current_path.nil?

      target = @path
      target_path = target.is_a?(String) ? target : target.path
      return current_path == target_path
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
        if has_submenu?
          if is_active?(renderer: renderer)
            %Q{<button type="button" aria-expanded="false" aria-controls="#{submenu_id}" class="menu-item-label sub-menu-toggle"><span class="menu-item-label-inner">#{label}</span></button>}
          else
            renderer.link_to(label, @path, class: "sub-menu-toggle")
          end
        else
          if is_active?(renderer: renderer)
            %Q{<span class="menu-item-label"><span class="menu-item-label-inner">#{label}</span></span>}
          else
            renderer.link_to(label, @path)
          end
        end
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
        classes << "menu-item--active" if is_active?(renderer: renderer)
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

    def has_active_submenu?(renderer:)
      current_path = renderer.item_rep&.path
      return false if current_path.nil?
      return false unless has_submenu?
      return submenu.map { _1[:path] }.include?(current_path)
    end

    def is_active?(renderer:)
      is_current?(renderer: renderer) || has_active_submenu?(renderer: renderer)
    end

    def rendered_submenu(renderer:)
      return "" unless has_submenu?
      submenu_html = submenu
                       .map { SubMenuItem.new(**_1) }
                       .map { _1.html(renderer: renderer) }
                       .join()
      return "".tap do |output|
        output << %Q{<ul id="#{submenu_id}" class="sub-navigation">}
        output << submenu_html
        output << %Q{</ul>}
      end
    end
  end

  class SubMenuItem < MenuItem
    def html(renderer:)
      classes = [].tap do |classes|
        classes << "sub-menu_item"
        classes << "menu-item--active" if is_active?(renderer: renderer)
      end.join(" ")

      return "".tap do |output|
        output << %Q{<li class="#{classes}">}
        output << rendered_link(renderer: renderer)
        output << %Q{</a>}
        output << %Q{</li>}
      end
    end
  end
end
