module CustomInputs
  class RadiosInput < SimpleForm::Inputs::CollectionRadioButtonsInput
    include UiBibz::Ui::Core::Forms::Choices

    def input(wrapper_options)
      label_method, value_method = detect_collection_methods
      i = UiBibz::Ui::Core::Forms::Choices::RadioField.new(attribute_name, options, input_html_options)

      @builder.send(:"collection_#{input_type}",
        attribute_name, collection, value_method, label_method,
        input_options, i.html_options,
        &collection_block_for_nested_boolean_style
      )
    end

  end
end
module SimpleForm
  module Tags
    class CollectionRadios < ActionView::Helpers::Tags::CollectionRadioButtons
      include CollectionExtensions

      def render
        wrap_rendered_collection(super)
      end

      private

      def render_component(builder)
        builder.radio + builder.label(class: "collection_radios")
      end
    end
  end
end
