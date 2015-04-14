module UiBibz::Ui
  class BreadcrumbLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :li, glyph_and_content_html, class_and_html_options
    end

  private

    def link
      link_to @content, @options[:url], @options[:link_html_options]
    end

  end
end
