module UiBibz::Ui::Core::Forms::Dates

  # Create a DatePickerField
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +prepend+ - String
  # * +append+ - String
  # * +range+ - String
  # * +autoclose+ - Boolean
  # * +today_highlight+ - Boolean
  # * +calendar_weeks+ - Boolean
  # * +dates_disabled+ - Array, String
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Dates::DatePickerField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Dates::DatePickerField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Dates::DatePickerField.new('date', { prepend: 'Prepend content', append: 'Append content' }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Dates::DatePickerField.new({ date_today_highlight: true, calendar_weeks: true, range: 'to' }, { class: 'test' }) do
  #     'date'
  #   end
  #
  # ==== Helper
  #
  #   date_picker_field(content, options = {}, html_options = {})
  #
  class DatePickerField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      if options[:range]
        content_tag :div, class: join_classes('input-group', 'input-daterange', size, status) do
          concat content_tag :span, options[:append], class: 'input-group-addon' unless @options[:append].nil?
          concat text_field_input_tag content[0]
          concat content_tag :span, options[:range], class: 'input-group-addon input-group-range'
          concat text_field_input_tag content[1]
          concat content_tag :span, options[:prepend], class: 'input-group-addon' unless @options[:prepend].nil?
        end
      else
        UiBibz::Ui::Core::Forms::Texts::SurroundField.new(content, options, html_options).render
      end
    end

  private

    def text_field_input_tag name
      if options[:builder].nil?
        text_field_tag name, html_options[:value], html_options
      else
        options[:builder].text_field name, html_options
      end
    end

    def component_html_data
      super
      date_locale
      provide
      format
      today_btn
      today_highlight
      calendar_weeks
      autoclose
      dates_disabled
    end

    def component_html_classes
      %w(date_picker form-control)
    end

    def component_html_options
      options[:state] == :disabled ? { disabled: 'disabled' } : {}
    end

    def date_locale
      add_html_data "date_locale", I18n.locale.to_s
    end

    def provide
      add_html_data "provide", 'datepicker'
    end

    def format
      add_html_data "date_format", picker_pattern
    end

    def picker_pattern
      options[:format] || I18n.t('datepicker.pformat', default: 'dd/mm/yyyy')
    end

    def today_btn
      add_html_data 'date_today_btn', 'linked'
    end

    def today_highlight
      add_html_data('date_today_highlight') if options[:today_highlight]
    end

    def calendar_weeks
      add_html_data("date_calendar_weeks") if options[:calendar_weeks]
    end

    def autoclose
      add_html_data("date_autoclose") if options[:autoclose]
    end

    def dates_disabled
      add_html_data("dates_disabled", [options[:dates_disabled]].flatten) if options[:dates_disabled]
    end

    # :lg, :sm or :xs
    def size
      "input-group-#{ options[:size] }" if options[:size]
    end

    def status
      "has-#{ options[:status] }" if options[:status]
    end

  end
end
