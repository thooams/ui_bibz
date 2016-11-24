module CustomInputs
  class FormulaInput < SimpleForm::Inputs::StringInput
    include UiBibz::Ui::Core::Inputs::Numbers

    def input(wrapper_options)
      options = @options.merge({ builder: @builder })
      UiBibz::Ui::Core::Inputs::Numbers::FormulaField.new(attribute_name, options, input_html_options).render
    end

  end
end
