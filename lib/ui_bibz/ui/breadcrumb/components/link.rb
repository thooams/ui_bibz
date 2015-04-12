module UiBibz::Ui
  class Link < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :li, [glyph, link].compact.join(' ').html_safe, class_and_html_options
    end

    def link
      link_to @content, @options[:url], @options[:link_html_options]
    end

  end
end
