# frozen_string_literal: true

module UiBibzInputs
  class UiComboboxFieldInput < CollectionInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(_wrapper_options)
      UiBibz::Ui::Core::Forms::Texts::ComboboxField.new(input_attribute_name, new_options, input_html_options).render
    end

    def new_options
      super.merge({ value: @builder.object.send(attribute_name) })
    end
  end
end
