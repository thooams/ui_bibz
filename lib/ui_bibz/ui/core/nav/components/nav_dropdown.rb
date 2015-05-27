module UiBibz::Ui::Core

  # Create a dropdown
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
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
  # * +state+ - State of élement with symbol value:
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
  #   UiBibz::Ui::Core::Dropdown.new(options = nil, html_options = nil).tap do |d|
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Dropdown.new(name, state: :success).tap do |d|
  #     d.list link_to('test', '#')
  #     d.list link_to('test2', '#')
  #   end.render
  #
  class NavDropdown < Dropdown

    def initialize content, options = nil, html_options  = nil, &block
      super
    end

    def render
      content_tag :li, class_and_html_options(type) do
        concat link_html
        concat ul_html
      end
    end

  private

    def link_html
      link_to button_content, "#", class: add_classes(size, "dropdown-toggle"), "data-toggle" => 'dropdown', "aria-expanded" => false
    end

  end
end
