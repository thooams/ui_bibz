module UiBibz::Ui
  class Link < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :li, content, class_and_html_options.merge({ role: 'presentation' })
    end

  private

    def content
      link_to @content, @options[:url], "aria-controls" => @options[:selector], "role" => "tab", "data-toggle" => "tab"
    end

  end
end
