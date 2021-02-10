# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Choices
  # Create a checkbox
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
  # * +state+ - Symbol
  #   (+:active+, +:disabled+)
  # * +inline+ - Boolean
  # * +checked+ - Boolean
  # * +action+ - String Stimulus Option
  # * +label+ - [String/Boolean]
  # * +boolean+ - Boolean Add an hidden field for rails
  # * +wrapper_html+: - Hash html_options for the wrapper
  # * +label_html+: - Hash html_options for the label
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::CheckboxField.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::CheckboxField.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::CheckboxField.new(content, { status: :success, type: :circle },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Forms::CheckboxField.new({ status: :primary }, { class: 'test' }) do
  #     content
  #   end.render
  #
  # ==== Helper
  #
  #   ui_checkbox_field(content, options = {}, html_options = {})
  #
  #   ui_checkbox_field(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class CheckboxField < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, wrapper_html_options  do
        concat hidden_field_tag(content, '0', id: "#{content}-hidden") if options[:boolean]
        concat check_box_tag(content, options[:value] || '1', options[:checked] || html_options[:checked], checkbox_html_options)
        concat label_tag(label_name, label_content, label_html_options) if options[:label] != false
      end
    end

    private

    def wrapper_html_options
      (options[:wrapper_html] || {}).tap do |option|
        option[:class] = UiBibz::Utils::Screwdriver.join_classes('form-check', inline, options[:wrapper_html].try(:[], :class))
      end
    end

    def label_html_options
      (options[:label_html] || {}).tap do |option|
        option[:class] = UiBibz::Utils::Screwdriver.join_classes('form-check-label', options[:label_html].try(:[], :class))
      end
    end

    def checkbox_html_options
      html_options.merge({
                           disabled: disabled?,
                           checked: html_options[:checked] || options[:state] == :active,
                           indeterminate: options[:indeterminate]
                         })
    end

    def label_name
      html_options[:id] || content
    end

    def label_content
      case options[:label]
      when nil
        content
      when false
        ' '
      else
        options[:label]
      end
    end

    def component_html_classes
      super << ['form-check-input', input_status]
    end

    def input_status
      "form-check-input-#{options[:status]}" if options[:status]
    end

    def status; end

    def inline
      'form-check-inline' if options[:inline]
    end
  end
end
