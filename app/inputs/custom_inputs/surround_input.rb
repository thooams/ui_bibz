module CustomInputs
  class SurroundInput < SimpleForm::Inputs::StringInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(wrapper_options)
      options = @options.merge({ builder: @builder })
      UiBibz::Ui::Core::Forms::Texts::SurroundField.new(attribute_name, options, input_html_options).render
    end

  end
end
