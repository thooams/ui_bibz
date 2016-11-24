module CustomInputs
  class SurroundInput < SimpleForm::Inputs::StringInput
    include UiBibz::Ui::Core::Inputs::Selects

    def input(wrapper_options)
      options = @options.merge({ builder: @builder })
      UiBibz::Ui::Core::Inputs::Selects::SurroundField.new(attribute_name, options, input_html_options).render
    end

  end
end
