# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundSwitchField < UiBibz::Ui::Core::Forms::Choices::SwitchField
    # See UiBibz::Ui::Core::Dropdown.initialize

    private

    def component_wrapper_html_classes
      super << 'input-group'
    end
  end
end
