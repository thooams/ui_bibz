# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Choices
  # Create a radio
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
  # * +value+ - String, Integer, Boolean [required]
  # * +state+ - Symbol
  #   (+:active+, +:disabled+)
  # * +inline+ - Boolean
  # * +action+ - String Stimulus Option
  # * +label+ - String
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::RadioField.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::RadioField.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::RadioField.new(content, { inline: true },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Forms::RadioField.new({ label: "My Radio" }, { class: 'test' }) do
  #     content
  #   end.render
  #
  # ==== Helper
  #
  #   ui_radio_field(content, options = {}, html_options = {})
  #
  #   ui_radio_field(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class RadioField < UiBibz::Ui::Core::Forms::Choices::CheckboxField
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      radio_field_html_tag
    end

    private

    def radio_field_html_tag
      content_tag :div, html_options.except(:id) do
        concat radio_button_tag content, options[:value], options[:checked] || false, checkbox_html_options
        concat label_tag label_name, label_content, class: 'form-check-label'
      end
    end

    def checkbox_html_options
      {
        disabled: options[:state] == :disabled,
        "data-action": options[:action],
        class: 'form-check-input'
      }
    end

    def label_name
      "#{content}_#{options[:value]}"
    end

    def component_html_classes
      ['form-check', inline]
    end
  end
end
