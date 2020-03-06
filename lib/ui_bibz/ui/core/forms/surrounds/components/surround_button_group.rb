# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundButtonGroup < UiBibz::Ui::Core::Forms::Buttons::ButtonGroup
    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize(content, options = nil, html_options = nil, &block)
      super
    end

    private

    def component_html_classes
      'input-group-btn'
    end
  end
end
