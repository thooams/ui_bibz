module UiBibz::Ui
  class BreadcrumbLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :li, link_html, class_and_html_options
    end

  private

    def link_html
      if @options[:url]
        link_to glyph_and_content_html, @options[:url], @options[:link_html_options]
      else
        glyph_and_content_html
      end
    end

  end
end
