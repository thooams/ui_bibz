module UiBibz::Ui
  class Button < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :button, [glyph, @content].compact.join.html_safe, class_and_html_options('btn')
    end

  private

    def state
      sym = @options[:state] || :default
      "btn-#{  states[sym] }"
    end

  end
end
