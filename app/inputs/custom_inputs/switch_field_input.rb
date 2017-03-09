module CustomInputs
  class SwitchFieldInput < SimpleForm::Inputs::Base
    include UiBibz::Ui::Core::Forms::Choices

    def input(wrapper_options)
      options = @options.merge({ builder: @builder })
      UiBibz::Ui::Core::Forms::Choices::SwitchField.new(attribute_name, options, input_html_options).render
    end

  end
end
