module CustomInputs
  class FormulaFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Numbers

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Numbers::FormulaField.new(input_attribute_name, options, input_html_options).render
    end

    def input_html_options
      super.merge({ value: @builder.object.send(attribute_name), formula_field_value: @builder.object.send(options[:formula_field_name] || attribute_formula_name)})
    end

    def attribute_formula_name
      "#{ attribute_name }_formula"
    end

  end
end
