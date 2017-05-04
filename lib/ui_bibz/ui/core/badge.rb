module UiBibz::Ui::Core

  # Create a badge
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
  # * +status+ - status of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  # * +type+ - Symbol
  #   (+pill+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Badge.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Badge.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Badge.new(content, status: :success, type: :pill).render
  #
  #   UiBibz::Ui::Core::Badge.new() do
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
  class Badge < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :span, glyph_and_content_html, html_options
    end

  private

    def component_html_classes
      ['tag', type]
    end

    def status
      "tag-#{ @options[:status] || :default  }"
    end

    def type
      "tag-pill" if @options[:type] == :pill
    end

  end
end
