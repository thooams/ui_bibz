# frozen_string_literal: true

module UiBibz::Ui::Core::Notifications
  # Create a tooltip
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Notifications::Tooltip.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::Tooltip.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::Tooltip.new("My content")
  #
  #   # or
  #
  #   UiBibz::Ui::Core::Notifications::Tooltip.new(position: :right) do
  #     content
  #   end
  #
  # ==== Helper
  #
  #   tooltip = UiBibz::Ui::Core::Notifications::Tooltip.new("My content", position: :left)
  #   ui_glyph("diamond", tooltip: tooltip)
  #
  #   # or
  #
  #   ui_glyph("diamond", {tooltip: true}, { title: "My content" })
  #
  #   # or
  #
  #   ui_glyph("diamond", tooltip: { title: "My content", position: :right})
  #
  class Tooltip < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::NotificationConcern

    # Note that for security reasons the sanitize, sanitizeFn, and allowList
    # options cannot be supplied using data attributes.
    # https://getbootstrap.com/docs/5.0/components/tooltips/#options
    DATA_ATTRIBUTES = %i[animation container delay html selector template trigger
                         fallbackPlacement boundary].freeze

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
      @content = @options[:title] if content.is_a?(Hash) && block.nil?
    end

    # Render html tag
    def render
      base_attributes.merge(data_attributes)
    end

    private

    def base_attributes
      {
        'data-bs-toggle' => 'tooltip',
        'data-bs-title' => @content.html_safe
      }.tap do |h|
        h['data-bs-placement'] = options[:position] || options[:placement] if (options[:position] || options[:placement]).present?
      end
    end

    def data_attribute_value(data_attribute)
      options[data_attribute].is_a?(String) ? options[data_attribute].html_safe : options[data_attribute]
    end
  end
end
