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
  # * +status+ - status of élement with symbol value:
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
    def initialize content, options = nil, html_options  = nil, &block
      super
    end

    # Render html tag
    def pre_render
      content_tag :li, html_options do
        concat link_html
        concat ul_html
      end
    end

  private

    def component_html_classes
      [type, 'nav-item']
    end

    def link_html
      link_to button_content, "#", class: join_classes(size, "dropdown-toggle", 'nav-link'), "data-toggle" => 'dropdown', "aria-expanded" => false
    end

  end
end
