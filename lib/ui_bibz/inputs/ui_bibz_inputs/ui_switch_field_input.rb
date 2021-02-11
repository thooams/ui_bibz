# frozen_string_literal: true

module UiBibzInputs
  class UiSwitchFieldInput < UiCheckboxFieldInput
    include UiBibz::Ui::Core::Forms::Choices

    def input(_wrapper_options)
      UiBibz::Ui::Core::Forms::Choices::SwitchField.new(input_attribute_name, new_options, new_input_html_options).render
    end
  end
end
