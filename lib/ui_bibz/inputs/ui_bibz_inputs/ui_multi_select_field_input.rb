module UiBibzInputs
  class UiMultiSelectFieldInput < CollectionInput

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new(input_attribute_name, new_options, input_html_options).render
    end

  end
end
