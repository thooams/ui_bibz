# frozen_string_literal: true

module UiBibzInputs
  class UiAutoCompleteFieldInput < CollectionInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new(input_attribute_name, new_options, input_html_options).render
    end

    def new_options
      super.merge({ value: @builder.object.send(attribute_name) })
    end

  end
end
