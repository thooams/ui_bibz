module CustomInputs
  class SwitchFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Choices

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Choices::SwitchField.new(input_attribute_name, new_options, input_html_options).render
    end

  end
end
