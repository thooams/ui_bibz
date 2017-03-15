module CustomInputs
  class SurroundFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Texts::SurroundField.new(input_attribute_name, options, input_html_options).render
    end

  end
end
