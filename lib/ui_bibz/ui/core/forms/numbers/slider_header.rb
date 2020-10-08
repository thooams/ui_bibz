# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Numbers
  # Create a SliderHeader
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
  #   UiBibz::Ui::Core::Forms::Numbers::SliderHeader.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Numbers::SliderHeader.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Numbers::SliderHeader.new(nil, max: 20, min: 0)
  #
  # ==== Helper
  #
  #   ui_slider_header(content, options = {}, html_options = {})
  #
  class SliderHeader < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat header_min
        concat header_max
      end
    end

    private

    def header_min
      content_tag :div, class: 'slider-header-min' do
        concat content_tag :label, options[:label_min] || 'Min: '
        concat content_tag :span, options[:thumb_min]
      end
    end

    def header_max
      content_tag :div, class: 'slider-header-max' do
        concat content_tag :label, options[:label_max] || 'max: '
        concat content_tag :span, options[:thumb_max]
      end
    end

    def component_html_classes
      'slider-header'
    end
  end
end
