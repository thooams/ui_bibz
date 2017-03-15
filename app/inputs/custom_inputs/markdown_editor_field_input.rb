module CustomInputs
  class MarkdownEditorFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Textareas

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new(input_attribute_name, options, input_html_options).render
    end

  end
end
