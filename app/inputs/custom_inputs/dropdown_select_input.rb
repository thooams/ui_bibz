module CustomInputs
  class DropdownSelectInput < SimpleForm::Inputs::CollectionInput
    include UiBibz::Ui::Core

    def input(wrapper_options)
      label_method, value_method = detect_collection_methods
      i = UiBibz::Ui::Core::DropdownSelectField.new(attribute_name, options, input_html_options)

      @builder.collection_select(
        attribute_name, collection, value_method, label_method,
        input_options, i.html_options
      )
    end
  end
end
