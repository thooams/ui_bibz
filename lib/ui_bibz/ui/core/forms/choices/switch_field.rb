# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Choices
  # Create a SurroundField
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # Source : http://www.bootstrap-switch.org/documentation-2.html
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
  # * +label+ - String
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::SwithField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::SwithField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   ui_switch_field 'name', checked: true
  #
  # ==== Helper
  #
  #   ui_switch_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class SwitchField < UiBibz::Ui::Core::Forms::Choices::CheckboxField
    private

    def component_options
      { boolean: true }
    end

    def component_html_classes
      ['form-check', 'form-switch', inline]
    end
  end
end
