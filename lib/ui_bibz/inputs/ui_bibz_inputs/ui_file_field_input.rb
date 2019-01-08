module UiBibzInputs
  class UiFileFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Files::FileField.new(input_attribute_name, options, input_html_options).render
    end

  end
end
