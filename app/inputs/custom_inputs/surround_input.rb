module CustomInputs
  class SurroundInput < SimpleForm::Inputs::StringInput
    include UiBibz::Ui::Core

    def input(wrapper_options)
      input_options = input_options || {}
      input_options = input_options.merge({ builder: @builder })
      UiBibz::Ui::Core::SurroundField.new(attribute_name, input_options, input_html_options).render
    end

  end
end
