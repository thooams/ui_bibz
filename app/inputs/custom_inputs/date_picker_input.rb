module CustomInputs
  class DatePickerInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      set_html_options
      set_value_html_option

      template.content_tag :div, class: 'input-group date' do
        input = super(wrapper_options) # leave StringInput do the real rendering
        input + input_button
      end
    end

    def input_html_classes
      super.push ''   # 'form-control'
    end

    private

    def input_button
      template.content_tag :span, class: 'input-group-btn' do
        template.content_tag :button, class: 'btn btn-secondary', type: 'button' do
          template.content_tag :span, '', class: 'fa fa-calendar'
        end
      end
    end

    def set_html_options
      input_html_options[:type] = 'text'
      input_html_options[:data] ||= {}
      input_html_options[:data].merge!(date_options_base)
    end

    def set_value_html_option
      return unless value.present?
      input_html_options[:value] ||= I18n.localize(value, format: display_pattern)
    end

    def value
      object.send(attribute_name) if object.respond_to? attribute_name
    end

    def display_pattern
      I18n.t('datepicker.dformat', default: '%d/%m/%Y')
    end

    def picker_pattern
      I18n.t('datepicker.pformat', default: 'dd/mm/yyyy')
    end

    def date_options_base
      {
          "provide"              => 'datepicker',
          "date-locale"          => I18n.locale.to_s,
          "date-format"          => picker_pattern,
          "date-today-btn"       => 'linked',
          "date-today-highlight" => true
      }
    end

  end
end
