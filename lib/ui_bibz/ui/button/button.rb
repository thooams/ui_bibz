module UiBibz::Ui
  class Button < Component

    # Create a button
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Button.new 'test', type: :primary, size: :xs
    #
    #   UiBibz::Ui::Button.new(type: :primary) do
    #     test
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :button, glyph_and_content_html, class_and_html_options(['btn', size])
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
