module UiBibz::Ui
  class ButtonLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      link_to [glyph, @content].compact.join.html_safe, @options[:url], class_and_html_options("btn")
    end

  private

    def state
      sym = @options[:state] || :default
      "btn-#{  states[sym] }"
    end

  end
end
