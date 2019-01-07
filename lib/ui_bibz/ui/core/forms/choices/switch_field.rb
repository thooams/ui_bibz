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
  #   box_switch_field 'name', { on_color: :primary }, { readonly: true }
  #
  # ==== Helper
  #
  #   box_switch_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class SwitchField < UiBibz::Ui::Core::Forms::Choices::CheckboxField

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    private

    def component_html_classes
      %w(custom-control custom-switch)
    end

  end
end
