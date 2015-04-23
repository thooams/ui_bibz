module UiBibz::Ui
  class ButtonDropdown < Dropdown

    # Create a button dropdown
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
    #   UiBibz::Ui::ButtonDropdown.new(options = nil, html_options = nil).tap do |d|
    #     d.list content = nil, options = nil, html_options = nil, &block
    #     d.list content = nil, options = nil, html_options = nil, &block
    #     d.list content = nil, options = nil, html_options = nil, &block
    #     ...
    #   end
    #
    # ==== Examples
    #
    #   UiBibz::Ui::ButtonDropdown.new(name, state: :success).tap do |d|
    #     d.list link_to('test', '#')
    #     d.list link_to('test2', '#')
    #   end.render
    #
    def initialize name, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, class_and_html_options(['btn-group', type]).merge({ role: 'group' }) do
        concat button_html
        concat ul_html
      end
    end

  end
end
