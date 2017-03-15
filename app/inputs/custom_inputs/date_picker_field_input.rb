module CustomInputs
  class DatePickerFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Dates

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Dates::DatePickerField.new(input_attribute_name, options, input_html_options).render
    end

  end
end
