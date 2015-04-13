module UiBibz::Ui
  class NavLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :li, class_and_html_options.merge({ role: 'presentation' }) do
        concat content_htm
        concat badge_html if @options[:badge]
      end
    end

  private

    # content_htm and not content_html for haml bug
    def content_htm
      link_to @content, @options[:url], html_options
    end

    def html_options
      if @options[:nav_type] == :tabs
        html_options = { "aria-controls" => @options[:selector], "role" => "tab", "data-toggle" => "tab" }
      else
        html_options = {}
      end
    end

  end
end
