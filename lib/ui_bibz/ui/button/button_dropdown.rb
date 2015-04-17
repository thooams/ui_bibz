module UiBibz::Ui
  class ButtonDropdown < Dropdown

    # Create a button dropdown
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::ButtonDropdown.new(name, state: :success).tap do |d|
    #     d.list link_to('test', '#')
    #     d.list link_to('test2', '#')
    #   end
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
