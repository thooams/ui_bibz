module CustomInputs
  class SwitchFieldInput < BaseInput
    include UiBibz::Ui::Core::Forms::Choices

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Choices::SwitchField.new(input_attribute_name, options, new_input_html_options).render
    end

    def new_options
      options.merge({ value: value })
    end

    def new_input_html_options
      input_html_options.merge({ checked: value.nil? ? false : value })
    end

    def value
      @value ||= @builder.object.send(attribute_name)
    end

  end
end
