module CustomInputs
  class FormulaInput < SimpleForm::Inputs::StringInput
    include UiBibz::Ui::Core::Inputs

    def input(wrapper_options)
      options = @options.merge({ builder: @builder })
      UiBibz::Ui::Core::Inputs::FormulaField.new(attribute_name, options, input_html_options).render
    end

  end
end
