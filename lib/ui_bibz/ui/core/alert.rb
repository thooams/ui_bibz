module UiBibz::Ui::Core

  # Create an alert
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +status+ - status of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Alert.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Alert.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Alert.new(content, { status: :success, glyph: 'eye' },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Alert.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     content
  #   end.render
  #
  # ==== Helper
  #
  #   notify(content, options = {}, html_options = {})
  #
  #   notify(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Alert < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, html_options do
        concat glyph_and_content_html
        concat close_html if options[:closable]
      end
    end

  private

    def component_html_classes
      ['alert', 'alert-dismissible']
    end

    def component_html_options
      { role: 'alert'}
    end

    def close_html
      content_tag :button, type: 'button', class: 'close', "data-dismiss" => "alert", "aria-label" => "Close" do
        concat content_tag :span, "×", "aria-hidden" => true
        concat content_tag :span, "Close", class: "sr-only"
      end
    end

    def status
      sym = options[:status] || :info
      "alert-#{ sym }"
    end

  end
end
