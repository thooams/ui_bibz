# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundDropdown < UiBibz::Ui::Core::Forms::Dropdowns::Dropdown
    # See UiBibz::Ui::Core::Dropdown.initialize

    private

    def component_html_classes
      super << 'input-group-btn'
    end
  end
end
