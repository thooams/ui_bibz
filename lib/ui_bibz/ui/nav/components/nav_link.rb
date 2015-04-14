module UiBibz::Ui
  class NavLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :li, content_htm, class_and_html_options.merge({ role: 'presentation' })
    end

  private

    # content_htm and not content_html for haml bug
    def content_htm
      link_to @options[:url], link_html_options do
        concat glyph_and_content_html
        concat badge_html if @options[:badge]
      end
    end

    def link_html_options
      lho = @options[:link_html_options] || {}
      if @options[:nav_type] == :tabs
        lho.merge({ "aria-controls" => @options[:selector], "role" => "tab", "data-toggle" => "tab" })
      else
        lho
      end
    end

  end
end
