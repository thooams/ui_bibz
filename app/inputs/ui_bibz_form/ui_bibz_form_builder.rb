module UiBibzForm
  class UiBibzFormBuilder < SimpleForm::FormBuilder
    include ActionView::Helpers

    attr_accessor :output_buffer

    def surround_field content = nil, opts = nil, html_options = nil, &block
      content = (options || {}).merge(content || {})
      content  = content.merge(template: @template, form: self)

      content_tag :div, "form-group surround_field" do
        concat content_tag(:label, content[:label]) unless content[:label].nil?
        concat UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(content, opts, html_options).tap(&block).render
      end
    end

  end
end
