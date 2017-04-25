module UiBibzInputs
  class AutoCompleteFieldInput < CollectionInput
    include UiBibz::Ui::Core::Forms::Texts

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new(input_attribute_name, new_options, input_html_options).render
    end

    def input_html_options
      opts = super
      opts = opts.merge({ disabled: options[:disabled] })           unless options[:disabled].blank?
      opts = opts.merge({ value: @builder.object.send(attribute_name) })
      opts
    end
  end
end
