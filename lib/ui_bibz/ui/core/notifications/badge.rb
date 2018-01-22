module UiBibz::Ui::Core::Notifications

  # Create a badge
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
  #   (+:primary+, +:secondary+, +:success+, +:danger+, +:warning+, +:info+, +:light+, +:dark+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  # * +type+ - Symbol
  #   (+:pill+, +:square+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Notifications::Badge.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::Badge.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::Badge.new(content, status: :success, type: :pill).render
  #
  #   UiBibz::Ui::Core::Notifications::Badge.new() do
  #     #content
  #   end.render
  #
  # ==== Helper
  #
  #   ui_badge(content, options = {}, html_options = {})
  #
  #   ui_badge(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Badge < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      content_tag :span, glyph_and_content_html, html_options
    end

  private

    def component_html_classes
      ['badge', type]
    end

    def status
      "badge-#{ @options[:status] || :default  }"
    end

    def type
      "badge-pill" if @options[:type] == :pill
    end

  end
end
