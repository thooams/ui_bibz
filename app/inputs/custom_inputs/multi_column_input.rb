module CustomInputs
  class MultiColumnInput < SimpleForm::Inputs::CollectionInput
    include UiBibz::Ui::Core

    def input(wrapper_options)
      label_method, value_method = detect_collection_methods
      i = UiBibz::Ui::Core::MultiColumnField.new(attribute_name, input_options, input_html_options)

      input_options.delete(:prompt)
      input_options.merge!({include_blank: false})

      @builder.collection_select(
        attribute_name, collection, value_method, label_method,
        input_options, i.html_options
      )
    end
  end
end
