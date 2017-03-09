module CustomInputs
  class SelectFieldInput < CollectionInput

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Selects::SelectField.new(attribute_name, new_options, input_html_options).render
    end
  end
end
