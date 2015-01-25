module UiBibz::Ui
  class Tab < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @tab = Component.new content, options, html_options, &block
    end

    def render
      content_tag :li, content, class_and_html_options
    end

    def content
      selector = @tab.options[:selector] || ''
      link_to @tab.render, "##{selector}", "aria-controls" => selector, "role" => "tab", "data-toggle" => "tab"
    end

    def class_and_html_options
      html_options = {}
      html_options = @tab.class_and_html_options('active') if @tab.options[:active]
      html_options = { role: 'presentation' }.merge(html_options)
      html_options
    end

  end
end
