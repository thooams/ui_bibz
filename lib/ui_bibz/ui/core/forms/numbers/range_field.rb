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
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:success+, :info+, +:warning+, +:danger+, +:light+, +:dark+)
  # * +thumb_status+ - status of the thumb:
  #   (+:primary+, +:secondary+, +:success+, :info+, +:warning+, +:danger+, +:light+, +:dark+)
  # * +track_status+ - status of track:
  #   (+:primary+, +:secondary+, +:success+, :info+, +:warning+, +:danger+, +:light+, +:dark+)
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

    # Render html tag
    def pre_render
      capture do
        concat range_field_tag(content, options[:value] || html_options[:value], html_options)
        concat datalist_tag if options[:tick]
      end
    end

    def html_id
      @html_id ||= html_options[:id] || generate_id('range')
    end

    private

    def datalist_tag
      content_tag :datalist, id: datalist_id do
        (html_min..html_max).step(html_step).map do |i|
          content_tag :option, option_label(i), value: i, label: option_label(i)
        end.join.html_safe
      end
    end

    def component_html_options
      options[:tick] ? super.merge(list: datalist_id) : super
    end

    def component_html_classes
      ['form-range', status, thumb_status, track_status]
    end

    def status
      "form-range-#{options[:status]}" if options[:status]
    end

    def thumb_status
      "form-range-thumb-#{options[:thumb_status]}" if options[:thumb_status]
    end

    def track_status
      "form-range-track-#{options[:track_status]}" if options[:track_status]
    end

    def option_label(value)
      value if [html_min, middle_range_value, html_max].include?(value)
    end

    def middle_range_value
      (html_min..html_max).to_a[(html_min..html_max).size / 2]
    end

    def datalist_id
      "#{html_id}-list"
    end
  end
end
