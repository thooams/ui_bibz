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
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:success+, :info+, +:warning+, +:danger+, +:light+, +:dark+)
  # * +track_status+ - status of track:
  #   (+:primary+, +:secondary+, +:success+, :info+, +:warning+, +:danger+, +:light+, +:dark+)
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
        concat range_field_tag(options[:input_name_min] || range_name('_min'), options[:thumb_min] || 0, range_html_options)
        concat range_field_tag(options[:input_name_max] || range_name('_max'), options[:thumb_max] || 100, range_html_options)
      end
    end

    def slider_html
      content_tag :div do
        concat content_tag :div, '', class: 'slider-inverse-left', style: 'width: 100%'
        concat content_tag :div, '', class: 'slider-inverse-right', style: 'width: 100%'
        concat content_tag :div, '', class: 'slider-range', style: "left: #{left_percentage}%; right: #{100 - right_percentage}%"
        concat content_tag :div, '', class: 'slider-thumb slider-thumb-left', style: "left: #{left_percentage}%"
        concat content_tag :div, '', class: 'slider-thumb slider-thumb-right', style: "left: #{right_percentage}%"
      end
    end

    def range_html_options
      { max: options[:max] || 100, min: options[:min] || 0, step: options[:step] || 1, disabled: disabled }
    end

    def not_on_hundred_percent?
      (options[:max].present? && options[:max] != 100) || (options[:min].present? && options[:min] != 0)
    end

    def absolute_total
      @absolute_total ||= min.abs + max.abs
    end

    def absolute_min
      (min - thumb_min).abs
    end

    def absolute_max
      (max - thumb_max).abs
    end

    def min
      options[:min] || 0
    end

    def max
      options[:max] || 100
    end

    def thumb_min
      options[:thumb_min] || 0
    end

    def thumb_max
      options[:thumb_max] || 100
    end

    def left_percentage
      @left_percentage ||= not_on_hundred_percent? ? 100 * absolute_min / absolute_total : thumb_min
    end

    def right_percentage
      @right_percentage ||= not_on_hundred_percent? ? 100 - (100 * absolute_max / absolute_total) : thumb_max
    end

    def component_html_classes
      ['slider', status, track_status, ('disabled' if disabled)]
    end

    def disabled
      'disabled' if options[:state] == :disabled || html_options[:disabled]
    end

    def status
      "slider-#{options[:status]}" if options[:status]
    end

    def track_status
      "slider-track-#{options[:track_status]}" if options[:track_status]
    end

    def range_name(suffix)
      if content.end_with?(']')
        content.dup.insert(-2, suffix)
      else
        "#{content}#{suffix}"
      end
    end
  end
end
