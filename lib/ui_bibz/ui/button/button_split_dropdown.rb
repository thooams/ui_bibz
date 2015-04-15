module UiBibz::Ui
  class ButtonSplitDropdown < Dropdown

    def initialize name, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, class_and_html_options(['btn-group', type]).merge({ role: 'group' }) do
        concat button_html
        concat split_html
        concat ul_html
      end
    end

  private


    def button_html
      content_tag :button, button_content, class: "btn #{ button_state }"
    end

    def split_html
      content_tag :button, split_content, class: "btn #{ button_state } dropdown-toggle", type: 'button', "data-toggle" => 'dropdown', "aria-expanded" => false
    end

    def split_content
      [caret, src_only].join.html_safe
    end

    def src_only
      content_tag :span, "Toggle Dropdown", class: "sr-only"
    end

    def button_content
      [glyph_with_space, @content].compact.join.html_safe
    end

  end
end
