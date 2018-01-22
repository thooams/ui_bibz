module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundButton < UiBibz::Ui::Core::Forms::Buttons::Button

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize content, options = nil, html_options  = nil, &block
      super
    end

    def pre_render
      content_tag :div, class: 'input-group-btn' do
        button_html_tag
      end
    end

  end
end
