module UiBibz::Ui::Core::Forms::Surrounds

  # Create a surround_button
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
  #   UiBibz::Ui::Core::Forms::Surrounds::SurroundButton.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Surrounds::SurroundButton.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Surrounds::SurroundButton.new(content, { type: :success, glyph: 'eye' }, { class: 'test' })
  #   # or
  #   UiBibz::Ui::Core::Forms::Surrounds::SurroundButton.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     content
  #   end
  #
  class SurroundDropdown < UiBibz::Ui::Core::Dropdowns::Dropdown

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize content, options = nil, html_options  = nil, &block
      super
    end

    private

    def component_html_classes
      [type, "btn-group", open, 'input-group-btn']
    end

  end
end
