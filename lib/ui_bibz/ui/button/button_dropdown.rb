module UiBibz::Ui
  class ButtonDropdown < Dropdown

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
