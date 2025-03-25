# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Dropdowns::Components
  # Create DropdownLink
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
  # * +state+ - status of element with symbol value:
  #   (+:active+)
  # * +url+ - String
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  # * +link_html_options+ - Hash
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::DropdownLink.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::DropdownLink.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::DropdownLink.new('Home', { glyph: 'home', state: :active, url: '#home', link_html_options: { class: 'link1' }},{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Forms::DropdownLink.new({ glyph: { name: 'eye', size: 3 }, url: '#home' }, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class DropdownLink < UiBibz::Ui::Core::Navigations::Link
    # See UiBibz::Ui::Core::Component.initialize

    private

    def component_html_classes
      'dropdown-item'
    end
  end
end
