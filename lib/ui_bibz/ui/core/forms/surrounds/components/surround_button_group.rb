module UiBibz::Ui::Core::Forms::Surrounds

  # Create a surround_button_choice
  #
  # This element is an extend of UiBibz::Ui::Core::Navs::Component.
  # You can use tap method to add list items.
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
  #
  # # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Surrounds::SurroundButtonChoice.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Surrounds::SurroundButtonChoice.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  class SurroundButtonGroup < UiBibz::Ui::Core::Forms::Buttons::ButtonGroup

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize content, options = nil, html_options = nil, &block
      super
    end

    private

    def component_html_classes
      ["btn-#{ type }", size, position, 'input-group-btn']
    end

  end
end
