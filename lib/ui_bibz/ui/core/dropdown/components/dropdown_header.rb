module UiBibz::Ui::Core

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
  #   UiBibz::Ui::Core::DropdownHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::DropdownHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::DropdownHeader.new('Home',{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::DropdownHeader.new({ class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class DropdownHeader < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :h6, @content, class_and_html_options('dropdown-header').merge({ role: 'presentation' })
    end

  end
end
