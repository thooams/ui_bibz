module UiBibzInputs
  class UiButtonChoicesInput < CollectionInput#::Inputs::CollectionRadioButtonsInput
    include UiBibz::Ui::Core::Forms::Buttons

    def input(wrapper_options = nil)
      label_method, value_method = detect_collection_methods

      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

      collection.map do |item|
        opts = { type: input_options[:type] || :checkbox, name: "#{ @builder.object.class.name.underscore }[#{ attribute_name }]", value: item[1] }
        opts = opts.merge({ state: :active }) if @builder.object.send(attribute_name).to_s == item[1].to_s
        UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new(item[0], opts).render
      end.join
    end

  end
end
