module UiBibz::Ui
  class Alert < Component

    # Create an alert
    #
    # ==== Signatures
    #
    #   Alert.new(content, type: :success)
    #
    #   Alert.new() do
    #     #content
    #   end
    #
    def initialize content, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, [glyph, @content].compact.joins(' '), class_and_html_options('alert').merge({ role: 'alert'})
    end

  private

    def state
      sym = @options[:state] || :info
      "alert-#{  states[sym] }"
    end

  end
end
