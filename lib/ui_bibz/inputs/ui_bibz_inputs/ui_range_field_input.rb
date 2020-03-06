# frozen_string_literal: true

module UiBibzInputs
  class UiRangeFieldInput < UiTextFieldInput
    include UiBibz::Ui::Core::Forms::Numbers

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Numbers::RangeField.new(input_attribute_name, options, input_html_options).render
    end

  end
end
