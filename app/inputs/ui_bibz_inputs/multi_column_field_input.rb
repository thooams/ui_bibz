module UiBibzInputs
  class MultiColumnFieldInput < CollectionInput
    include UiBibz::Ui::Core::Forms::Selects

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new(attribute_name, new_options, input_html_options).render
    end

  end
end
