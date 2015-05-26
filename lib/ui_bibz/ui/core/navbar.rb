module UiBibz::Ui::Core

  # Create a Navbar
  #
  #
  class Navbar < UiBibz::Ui::Core::Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    def render
      content_tag :nav, class_and_html_options('navbar navbar-default') do
        content_tag :div, class: 'container-fluid' do
          concat header_html
          concat body_html
        end
      end
    end

    def item item
      @items << item
    end

  private

    def header_html
      content_tag :div, class: 'navbar-header' do
        concat navbar_toggle_button_html
        concat link_to [glyph_with_space, @options[:title]].compact.join.html_safe, '#', class: 'navbar-title'
      end
    end

    def body_html
      content_tag :div, @items.join.html_safe, class: "collapse navbar-collapse", id: "navbar-collapse-#{ id }"
    end

    def id
      @id ||= "navbar-collaps-#{ Random.new_seed }"
    end

    def navbar_toggle_button_html
      content_tag :button, class: 'navbar-toggle collapsed', data: { toggle: 'collapse', target:"#navbar-collapse-#{ id }" } do
        concat content_tag :span, 'Toggle navigation', class: 'sr-only'
        concat content_tag :span, '', class: 'icon-bar'
        concat content_tag :span, '', class: 'icon-bar'
        concat content_tag :span, '', class: 'icon-bar'
      end
    end

  end
end
