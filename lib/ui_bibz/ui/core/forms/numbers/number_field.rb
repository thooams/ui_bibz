# frozen_string_literal: true

require 'ui_bibz/ui/extensions/core/forms/surround_extension'
module UiBibz::Ui::Core::Forms::Numbers
  # Create a NumberField
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
  # * +prepend+ - String, Html
  # * +append+ - String, Html
  # * +max+ - [Float, Integer]
  # * +min+ - [Float, Integer]
  # * +step+ - [Float, Integer]
  # * +in+ - Array
  # * +within+ - Array
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Numbers::NumberField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Numbers::NumberField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Numbers::NumberField.new('search', prepend: 'Prepend content', append: 'Append content', class: 'test')
  #
  #   UiBibz::Ui::Core::Forms::Numbers::NumberField.new(prepend: glyph('pencil'), append: glyph('camera-retro')) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   ui_number_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class NumberField < UiBibz::Ui::Core::Forms::Texts::TextField
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      surround_field number_field_input_tag
    end

    private

    # Simple_form or not
    def number_field_input_tag
      number_field_tag content, options[:value] || html_options[:value], html_options
    end

    def component_html_options
      {
        min: options[:min],
        max: options[:max],
        step: options[:step],
        in: options[:in],
        within: options[:within]
      }
    end

    def html_max
      options[:max] || 100
    end

    def html_min
      options[:min] || 0
    end

    def html_step
      options[:step] || 1
    end

    def html_in
      options[:in]
    end

    def html_within
      options[:within]
    end
  end
end
