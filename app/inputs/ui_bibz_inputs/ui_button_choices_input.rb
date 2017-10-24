module UiBibzInputs
  class UiButtonChoicesInput < CollectionInput#::Inputs::CollectionRadioButtonsInput
    include UiBibz::Ui::Core::Forms::Buttons

    def input(wrapper_options = nil)
      label_method, value_method = detect_collection_methods

      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

      UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new(input_options).tap do |bc|
        collection.each do |item|
          opts = { name: "#{ @builder.object.class.name.underscore }[#{ attribute_name }]", value: item[1] }
          opts = opts.merge({ state: :active }) if @builder.object.send(attribute_name).to_s == item[1].to_s
          bc.button item[0], opts
        end
      end.render
    end

  end
end
