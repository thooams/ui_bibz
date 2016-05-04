module CustomInputs
  class DropdownSelectInput < SimpleForm::Inputs::CollectionInput
    include UiBibz::Ui::Core

    def input(wrapper_options)
      label_method, value_method = detect_collection_methods
      i = UiBibz::Ui::Core::DropdownSelectField.new(attribute_name, options, input_html_options)

      input_options.delete(:prompt)
      input_options.merge!({include_blank: false})

      if options[:grouped] == true
        @builder.grouped_collection_select(
          attribute_name, grouped_collection,
          group_method, group_label_method,
          value_method, label_method,
          input_options, i.html_options
        )
      else
        @builder.collection_select(
         attribute_name, collection, value_method, label_method,
         input_options, i.html_options
        )
      end
    end

    def grouped_collection
      @grouped_collection ||= begin
        grouped_collection = options.delete(:collection)
        grouped_collection.respond_to?(:call) ? grouped_collection.call : grouped_collection.to_a
      end
    end

    def collection
      if options[:grouped]
        @collection ||= grouped_collection.map { |collection| collection.try(:send, group_method) }.detect(&:present?) || []
      else
        @collection ||= options[:collection]
      end
    end

    def group_method
      @group_method ||= options.delete(:group_method)
    end

    def group_label_method
      label = options.delete(:group_label_method)

      unless label
        common_method_for = detect_common_display_methods(detect_collection_classes(grouped_collection))
        label = common_method_for[:label]
      end

      label
    end
  end
end
