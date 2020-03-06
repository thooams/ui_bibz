# frozen_string_literal: true

module UiBibzInputs
  class UiRadioFieldInput < SimpleForm::Inputs::CollectionRadioButtonsInput
    include UiBibz::Ui::Core::Forms::Choices

    def input(wrapper_options)
      i = UiBibz::Ui::Core::Forms::Choices::RadioField.new(attribute_name, options, input_html_options)
      options[:item_wrapper_tag] = :div
      options[:item_wrapper_class] = i.html_options[:class]

      label_method, value_method = detect_collection_methods

      @builder.send(:"collection_radio_buttons",
        attribute_name, collection, value_method, label_method,
        input_options, i.html_options,
        &collection_block_for_nested_boolean_style
      )
    end

  end
end
