# frozen_string_literal: true

module UiBibzInputs
  class UiNumberFieldInput < UiTextFieldInput
    include UiBibz::Ui::Core::Forms::Numbers

    def input(wrapper_options)
      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
      UiBibz::Ui::Core::Forms::Numbers::NumberField.new(input_attribute_name, options, merged_input_options).render
    end
  end
end
