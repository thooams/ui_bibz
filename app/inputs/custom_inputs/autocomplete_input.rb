module CustomInputs
  class AutocompleteInput < SimpleForm::Inputs::CollectionInput
    include UiBibz::Ui::Core
    include ActionView::Helpers::FormOptionsHelper

    def input(wrapper_options)
      label_method, value_method = detect_collection_methods
      ap label_method
      ap value_method
      ap @options
      options = options || {}
      ap collection
      options = options.merge({ builder: @builder })
      options = options.merge(option_tags: options_from_collection_for_select(collection, label_method, label_method))
      UiBibz::Ui::Core::AutocompleteField.new(attribute_name, options, input_html_options).render
    end
  end
end
