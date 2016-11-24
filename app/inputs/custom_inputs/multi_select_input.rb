module CustomInputs
  class MultiSelectInput < SimpleForm::Inputs::CollectionInput
    include UiBibz::Ui::Core::Inputs::Selects

    def input(wrapper_options)
      label_method, value_method = detect_collection_methods
      i = UiBibz::Ui::Core::Inputs::Selects::MultiSelectField.new(attribute_name, options, input_html_options)

      @builder.collection_select(
        attribute_name, collection, value_method, label_method,
        input_options, i.html_options
      )
    end
  end
end
