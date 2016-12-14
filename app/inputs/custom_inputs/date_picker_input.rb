module CustomInputs
  class DatePickerInput < SimpleForm::Inputs::StringInput
    include UiBibz::Ui::Core::Forms::Dates

    def input(wrapper_options)
      options = @options.merge({ builder: @builder })
      UiBibz::Ui::Core::Forms::Dates::DatePickerField.new(attribute_name, options, input_html_options).render
    end

  end
end
