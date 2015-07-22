module UiBibz::Ui::Core

  # Create a label
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # The helper use 'etiquette' method to avoid conflict with Rails.
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
  #   UiBibz::Ui::Core::Label.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Label.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Label.new(content, state: :success).render
  #
  #   UiBibz::Ui::Core::Label.new() do
  #     #content
  #   end.render
  #
  # ==== Helper
  #
  #   etiquette(content, options = {}, html_options = {})
  #
  #   etiquette(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Label < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
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