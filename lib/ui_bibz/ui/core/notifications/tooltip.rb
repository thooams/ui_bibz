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
  #   UiBibz::Ui::Core::Notifications::Tooltip.new(class: 'my-toast').tap |t|
  #     t.header "My header toast", glyph: 'eye', time: 'now'
  #     t.body "My body toast"
  #   end
  #
  # ==== Helper
  #
  #   tooltip = UiBibz::Ui::Core::Notifications::Tooltip.new(position: left) do
  #      My content
  #   end
  #   ui_glyph("diamond", tooltip: tooltip)
  #
  class Tooltip < UiBibz::Ui::Core::Component
    # Note that for security reasons the sanitize, sanitizeFn, and allowList
    # options cannot be supplied using data attributes.
    # https://getbootstrap.com/docs/5.0/components/tooltips/#options
    DATA_ATTRIBUTES = %i[animation container delay html selector template trigger
                         offset fallback_placement boundary].freeze

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
      @content = @options[:title] if content.is_a?(Hash) && block.nil?
    end

    # Render html tag
    def render
      {
        'data-bs-toggle' => 'tooltip',
        'data-bs-title' => @content,
        'data-bs-placement' => options[:position] || options[:placement]
      }.merge(data_attributes)
    end

    private

    def data_attributes
      DATA_ATTRIBUTES.map do |data_attribute|
        { "data-bs-#{data_attribute}" => options[data_attribute] }
      end.reduce(&:merge)
    end
  end
end
