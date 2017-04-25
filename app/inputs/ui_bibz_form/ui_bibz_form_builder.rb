module UiBibzForm
  class UiBibzFormBuilder < SimpleForm::FormBuilder

    def surround_field content = nil, opts = nil, html_options = nil, &block
      content = (options || {}).merge(content || {})
      content  = content.merge(template: @template, form: self)
      UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(content, opts, html_options).tap(&block).render
    end

  end
end
