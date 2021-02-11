# frozen_string_literal: true

module UiBibzInputs
  class UiRadioFieldInput < UiCheckboxFieldInput
    def input(_wrapper_options)
      UiBibz::Ui::Core::Forms::Choices::RadioField.new(input_attribute_name, new_options, input_html_options).render
    end
  end
end
