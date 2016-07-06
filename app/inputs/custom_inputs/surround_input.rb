module CustomInputs
  class SurroundInput < SimpleForm::Inputs::StringInput
    include UiBibz::Ui::Core::Inputs

    def input(wrapper_options)
      options = @options.merge({ builder: @builder })
      UiBibz::Ui::Core::Inputs::SurroundField.new(attribute_name, options, input_html_options).render
    end

  end
end
