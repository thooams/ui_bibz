# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundCheckboxField < UiBibz::Ui::Core::Forms::Choices::CheckboxField

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize content, options = nil, html_options  = nil, &block
      super
    end

    private

    def component_html_classes
      super << "input-group-addon"
    end

  end
end
