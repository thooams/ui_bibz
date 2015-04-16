module UiBibz::Ui
  class ButtonLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      link_to glyph_and_content_html, @options[:url], class_and_html_options("btn")
    end

  private

    def state
      sym = @options[:state] || :default
      "btn-#{  states[sym] }"
    end

    # :lg, :sm or :xs
    def size
      "btn-#{ @options[:size] }" if @options[:size]
    end

  end
end
