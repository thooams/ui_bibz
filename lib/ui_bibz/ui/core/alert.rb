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
  # * +state+ - State of élement with symbol value:
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
  #   UiBibz::Ui::Core::Alert.new(content, { type: :success, glyph: 'eye' },{ class: 'test' }).render
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
