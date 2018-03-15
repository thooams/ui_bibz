module UiBibzInputs
  class UiNumberFieldInput < UiTextFieldInput
    include UiBibz::Ui::Core::Forms::Numbers

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Numbers::NumberField.new(input_attribute_name, options, input_html_options).render
    end

  end
end