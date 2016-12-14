module CustomInputs
  class AutocompleteInput < SimpleForm::Inputs::CollectionInput
    include UiBibz::Ui::Core::Forms::Texts
    include ActionView::Helpers::FormOptionsHelper

    def input(wrapper_options)
      label_method, value_method = detect_collection_methods
      options = options || {}
      options = options.merge({ builder: @builder })
      options = options.merge(option_tags: options_from_collection_for_select(collection, label_method, label_method))

      UiBibz::Ui::Core::Forms::Texts::AutocompleteField.new(attribute_name, options, input_html_options).render
    end
  end
end
