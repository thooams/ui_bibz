module UiBibzForm
  if defined?(SimpleForm)
    class UiBibzFormBuilder < SimpleForm::FormBuilder
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::TextHelper
      include UiBibz::Utils

      attr_accessor :output_buffer

      def ui_surround_field content = nil, opts = nil, html_options = nil, &block
        content = (options || {}).merge(content || {})
        content  = content.merge(template: @template, form: self)

        input_classes  = UiBibz::Utils::Screwdriver.join_classes('form-group', 'surround_field', options[:input_html].try(:[], :class))
        wrapper_html   = (options[:input_html] || {}).merge({ class: input_classes })
        surround_field =  UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(content, opts, html_options).tap(&block)
        errors_text    = surround_field.errors.flatten.to_sentence
        required       = surround_field.required_fields.any?{ |u| u == true }
        wrapper_classes = UiBibz::Utils::Screwdriver.join_classes(("has-error" unless errors_text.blank?), wrapper_html.try(:[], :class))
        label_classes = UiBibz::Utils::Screwdriver.join_classes(("required" if required), 'control-label')
        abbr_html     = content_tag("abbr", I18n.t(:"simple_form.required.mark", default: '*'), title: I18n.t(:"simple_form.required.text", default: 'required')) if required

        wrapper_html[:class] = wrapper_classes

        content_tag :div, wrapper_html do
          concat content_tag(:label, "#{ abbr_html } #{ content[:label] }".html_safe, class: label_classes) if content[:label]
          concat surround_field.render
          concat content_tag(:span, errors_text || content[:hint], class: 'help-block') if !errors_text.blank? || !content[:hint].nil?
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
end
