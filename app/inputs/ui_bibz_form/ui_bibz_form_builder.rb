module UiBibzForm
  class UiBibzFormBuilder < SimpleForm::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper

    attr_accessor :output_buffer

    def ui_surround_field content = nil, opts = nil, html_options = nil, &block
      content = (options || {}).merge(content || {})
      content  = content.merge(template: @template, form: self)

      input_classes = UiBibz::Utils::Screwdriver.join_classes('form-group', 'surround_field', options[:input_html].try(:[], :class))
      wrapper_html = (options[:input_html] || {}).merge({ class: input_classes })

      content_tag :div, wrapper_html do
        concat content_tag(:label, content[:label]) unless content[:label].nil?
        concat UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(content, opts, html_options).tap(&block).render
      end
    end

    def ui_button_group content = nil, opts = nil, html_options = nil, &block
      content = (options || {}).merge(content || {})
      content  = content.merge(template: @template, form: self)

      input_classes = UiBibz::Utils::Screwdriver.join_classes('button_group', options[:input_html].try(:[], :class))
      wrapper_html = (options[:input_html] || {}).merge({ class: input_classes })

      content_tag :div, wrapper_html do
        concat content_tag(:label, content[:label]) unless content[:label].nil?
        concat UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(content, opts, html_options).tap(&block).render
      end
    end

  end
end
