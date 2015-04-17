module UiBibz::Ui
  class Alert < Component

    # Create an alert
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Alert.new(content, type: :success)
    #
    #   UiBibz::Ui::Alert.new() do
    #     #content
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, class_and_html_options('alert').merge({ role: 'alert'}) do
        concat glyph_and_content_html
        concat close_html if @options[:close]
      end
    end

  private

    def close_html
      content_tag :button, type: 'button', class: 'close', "data-dismiss" => "alert", "aria-label" => "Close" do
        content_tag :span, "x", "aria-hidden" => true
      end
    end

    def state
      sym = @options[:state] || :info
      "alert-#{ states[sym] }"
    end

  end
end
