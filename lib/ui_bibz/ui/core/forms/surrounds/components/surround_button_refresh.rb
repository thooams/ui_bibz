module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundButtonRefresh < UiBibz::Ui::Core::Forms::Buttons::ButtonRefresh

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize content, options = nil, html_options  = nil, &block
      super
    end

    def render
      content_tag :div, class: 'input-group-btn' do
        button_refresh_html_tag
      end
    end

  end
end
