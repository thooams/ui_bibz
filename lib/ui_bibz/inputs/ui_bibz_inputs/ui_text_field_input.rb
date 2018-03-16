module UiBibzInputs
  class UiTextFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Texts::TextField.new(input_attribute_name, options, input_html_options).render
    end

    def input_attribute_name
      "#{ @builder.object.class.name.gsub('::', "").underscore }[#{ attribute_name }]"
    end
  end
end
