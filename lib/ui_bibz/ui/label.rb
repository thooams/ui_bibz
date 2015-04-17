module UiBibz::Ui
  class Label < Component

    # Create an alert
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Label.new(content, type: :success)
    #
    #   UiBibz::Ui::Label.new() do
    #     #content
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :span, glyph_and_content_html, class_and_html_options('label')
    end

  private

    def state
      sym = @options[:state] || :default
      "label-#{ states[sym] }"
    end

  end
end
