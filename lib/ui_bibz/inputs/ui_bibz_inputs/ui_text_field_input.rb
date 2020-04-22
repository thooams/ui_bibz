# frozen_string_literal: true

module UiBibzInputs
  class UiTextFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(wrapper_options)
      unless string?
        input_html_classes.unshift('string')
        input_html_options[:type] ||= input_type if html5?
      end

      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
      UiBibz::Ui::Core::Forms::Texts::TextField.new(input_attribute_name, options, merged_input_options).render
    end
  end
end
