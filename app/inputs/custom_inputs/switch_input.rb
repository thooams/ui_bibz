module CustomInputs
  class SwitchInput < SimpleForm::Inputs::Base
    include UiBibz::Ui::Core

    def input(wrapper_options)
      options = options || {}
      options = options.merge({ builder: @builder })
      UiBibz::Ui::Core::SwitchField.new(attribute_name, options, input_html_options).render
    end

  end
end
