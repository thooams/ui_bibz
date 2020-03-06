# frozen_string_literal: true

module UiBibzInputs
  class UiCheckboxFieldInput < BaseInput
    include UiBibz::Ui::Core::Forms::Choices

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Choices::CheckboxField.new(input_attribute_name, new_options, new_input_html_options).render
    end

    def new_input_html_options
      input_html_options.merge({ checked: value.nil? ? false : value })
    end

    def value
      @value ||= @builder.object.send(attribute_name)
    end

    def new_options
      options.merge({ label: attribute_name.to_s.titleize })
    end

  end
end
