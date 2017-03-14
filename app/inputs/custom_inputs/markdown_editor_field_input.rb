module CustomInputs
  class MarkdownEditorFieldInput < SimpleForm::Inputs::StringInput
    include UiBibz::Ui::Core::Forms::Textareas

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new(input_attribute_name, new_options, input_html_options).render
    end

  end
end
