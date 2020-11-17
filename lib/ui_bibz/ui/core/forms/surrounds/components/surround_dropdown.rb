# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundDropdown < UiBibz::Ui::Core::Forms::Dropdowns::Dropdown
    # See UiBibz::Ui::Core::Dropdown.initialize

    def pre_render
      capture do
        concat button_html
        concat ul_html
      end
    end
  end
end
