module CustomInputs
  class AutoCompleteFieldInput < CollectionInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new(input_attribute_name, new_options, input_html_options).render
    end
  end
end
