# frozen_string_literal: true

module UiBibzInputs
  class UiSelectFieldInput < CollectionInput
    def input(wrapper_options)
      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
      UiBibz::Ui::Core::Forms::Selects::SelectField.new(input_attribute_name, new_options, merged_input_options).render
    end
  end
end
