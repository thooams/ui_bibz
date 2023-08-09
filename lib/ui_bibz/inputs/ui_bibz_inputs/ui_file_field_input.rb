# frozen_string_literal: true

module UiBibzInputs
  class UiFileFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(_wrapper_options)
      UiBibz::Ui::Core::Forms::Files::FileField.new(input_attribute_name, options, input_html_options).render
    end

    def input_attribute_name
      options[:multiple] ? "#{super}[]" : super
    end
  end
end
