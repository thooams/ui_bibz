module UiBibz::Ui

  # Create an alert
  #
  # See Ui#Component
  #
  # ==== Attributes
  #
  # * +content+ -   Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can
  # * +:state+ - State of élement
  # * +:glyph+ - Add glyph options
  #
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Alert.new(content, type: :success).render
  #   # or
  #   UiBibz::Ui::Alert.new() do
  #     content
  #   end.render
  #
  class Alert < Component

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
