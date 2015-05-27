module UiBibz::Ui::Core

  # Create a Navbar
  #
  #
  class Navbar < Component

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

    def nav content = nil, options = nil, html_options = nil, &block
      options = options || {}
      @items << UiBibz::Ui::Core::Nav.new(content, options.merge({ type: 'navbar', class: 'navbar-nav' }), html_options).tap(&block).render
    end

    def form content = nil, options = nil, html_options = nil, &block
     # @items << UiBibz::Ui::Core::Form.new(content, options, html_options).tap(&block)
    end

    def text content = nil, options = nil, html_options = nil, &block
     # @items << UiBibz::Ui::Core::Text.new(content, options, html_options).tap(&block)
    end

  private

    def header_html
      content_tag :div, class: 'navbar-header' do
        concat navbar_toggle_button_html
        concat link_to [glyph_with_space, @options[:title]].compact.join.html_safe, '#', class: 'navbar-brand'
      end
    end

    def body_html
      content_tag :div, @items.join.html_safe, class: "collapse navbar-collapse", id: id
    end

    def id
      @id ||= "navbar-collapse-#{ Random.new_seed }"
    end

    def navbar_toggle_button_html
      content_tag :button, class: 'navbar-toggle collapsed', data: { toggle: 'collapse', target:"##{ id }" } do
        concat content_tag :span, 'Toggle navigation', class: 'sr-only'
        concat content_tag :span, '', class: 'icon-bar'
        concat content_tag :span, '', class: 'icon-bar'
        concat content_tag :span, '', class: 'icon-bar'
      end
    end

  end
end
