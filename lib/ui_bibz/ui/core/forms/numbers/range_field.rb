# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Numbers
  # Create a RangeField
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
  # * +max+ - [Float, Integer]
  # * +min+ - [Float, Integer]
  # * +step+ - [Float, Integer]
  # * +in+ - Array
  # * +within+ - Array
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Numbers::RangeField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Numbers::RangeField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Numbers::RangeField.new(4, max: 20, min: 0, step: 2)
  #
  #   UiBibz::Ui::Core::Forms::Numbers::RangeField.new(max: 2, min: -3, step: 0.5) do
  #     5
  #   end
  #
  # ==== Helper
  #
  #   ui_range_field(content, options = {}, html_options = {})
  #
  #   ui_range_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class RangeField < UiBibz::Ui::Core::Forms::Numbers::NumberField
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      range_field_tag content, options[:value] || html_options[:value], html_options
    end

    private

    def component_html_classes
      'custom-range'
    end
  end
end
