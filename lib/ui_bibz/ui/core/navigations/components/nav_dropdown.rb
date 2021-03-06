# frozen_string_literal: true

module UiBibz::Ui::Core::Navigations
  # Create a dropdown
  #
  # This element is an extend of UiBibz::Ui::Core::Navigations::Component.
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
  # * +status+ - status of element with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::NavDropdown.new(options = nil, html_options = nil).tap do |d|
  #     ...
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::NavDropdown.new(name, status: :success).tap do |d|
  #     d.list link_to('test', '#')
  #     d.list link_to('test2', '#')
  #   end.render
  #
  class NavDropdown < UiBibz::Ui::Core::Forms::Dropdowns::Dropdown
    # See UiBibz::Ui::Core::Dropdown.initialize

    # Render html tag
    def pre_render
      content_tag :li, html_options do
        concat link_html
        concat ul_html
      end
    end

    private

    def component_html_classes
      [position, open, keep_open, 'nav-item', without_caret]
    end

    def link_html
      content_tag :a, button_content, class: join_classes(size, state, 'dropdown-toggle', 'nav-link'), href: '#', 'data-bs-toggle' => 'dropdown', 'aria-expanded' => false
    end
  end
end
