# frozen_string_literal: true

module UiBibzInputs
  class UiChoiceFieldInput < CollectionInput
    include UiBibz::Ui::Core::Forms::Choices

    def input(_wrapper_options)
      UiBibz::Ui::Core::Forms::Choices::Choice.new(input_attribute_name, options, input_html_options).render
    end
  end
end
