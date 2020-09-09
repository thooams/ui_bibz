# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundButton < UiBibz::Ui::Core::Forms::Buttons::Button
    # See UiBibz::Ui::Core::Dropdown.initialize

    def pre_render
      content_tag :div, class: 'input-group-btn' do
        button_html_tag
      end
    end
  end
end
