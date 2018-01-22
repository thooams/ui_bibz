module UiBibz::Ui::Core::Forms::Dropdowns::Components

  # Create DropdownHeader
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # Use '---' in content to add a separator
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::DropdownHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::DropdownHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::DropdownHeader.new('Home',{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Forms::DropdownHeader.new({ class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class DropdownHeader < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      content_tag :h6, content, html_options
    end

  private

    def component_html_classes
      'dropdown-header'
    end

    def component_html_options
      { role: 'presentation' }
    end

  end
end
