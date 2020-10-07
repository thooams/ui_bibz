# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Numbers
  # Create a SliderField
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
  #   UiBibz::Ui::Core::Forms::Numbers::SliderField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Numbers::SliderField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Numbers::SliderField.new(4, max: 20, min: 0, step: 2)
  #
  #   UiBibz::Ui::Core::Forms::Numbers::SliderField.new(max: 2, min: -3, step: 0.5) do
  #     5
  #   end
  #
  # ==== Helper
  #
  #   ui_slider_field(content, options = {}, html_options = {})
  #
  #   ui_slider_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class SliderField < UiBibz::Ui::Core::Forms::Numbers::NumberField
    # See UiBibz::Ui::Core::Component.initialize

    private

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat slider_html
        concat range_field_tag("#{content}_min", options[:value] || thumb_min, range_html_options)
        concat range_field_tag("#{content}_min", options[:value] || thumb_max, range_html_options)
      end
    end

    def slider_html
      content_tag :div do
        concat content_tag :div, '', class: 'slider-inverse-left', style: 'width: 100%'
        concat content_tag :div, '', class: 'slider-inverse-right', style: 'width: 100%'
        concat content_tag :div, '', class: 'slider-range', style: 'left: 0%; right: 0%'
        concat content_tag :div, '', class: 'slider-thumb slider-thumb-left', style: "left: #{thumb_min}%"
        concat content_tag :div, '', class: 'slider-thumb slider-thumb-right', style: "left: #{thumb_max}%"
      end
    end

    def range_html_options
      { max: options[:max] || 100, min: options[:min] || 0, step: options[:step] || 1 }
    end

    def thumb_min
      not_on_hundred_percent? ? 100 * options[:thumb_min] / options[:max] : (options[:thumb_min] || 0)
    end

    def thumb_max
      not_on_hundred_percent? ? 100 * options[:thumb_max] / options[:max] : (options[:thumb_max] || 100)
    end

    def not_on_hundred_percent?
      options[:max].present? && options[:max] != 100 || options[:min].present? && options[:min] != 0
    end

    def component_html_classes
      'slider'
    end
  end
end
