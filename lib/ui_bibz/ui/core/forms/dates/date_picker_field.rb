# frozen_string_literal: true

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

    # Render html tag
    def pre_render
      date_picker_field_html_tag
    end

    private

    def date_picker_field_html_tag
      if options[:range]
        UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(class: 'input-daterange').tap do |sf|
          sf.addon @options[:append] unless @options[:append].nil?
          sf.text_field content[0], nil, html_options
          sf.addon options[:range]
          sf.text_field content[1], nil, html_options
          sf.addon @options[:prepend] unless @options[:prepend].nil?
        end.render
      else
        UiBibz::Ui::Core::Forms::Texts::TextField.new(content, options, html_options).render
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
      toggle_active
      days_of_week_disabled
      days_of_week_highlighted
      multiple
      display_mode
      display_mode_min
      display_mode_max
    end

    def component_html_classes
      super << %w[date_picker form-control]
    end

    def component_html_options
      super.merge({ disabled: options[:state] == :disabled })
    end

    def date_locale
      @data_html_options_builder.add 'date_locale', value: I18n.locale.to_s
    end

    def provide
      @data_html_options_builder.add 'provide', value: 'datepicker'
    end

    def format
      @data_html_options_builder.add 'date_format', value: picker_pattern
    end

    def picker_pattern
      options[:format] || I18n.t('datepicker.pformat', default: 'yyyy-mm-dd')
    end

    def today_btn
      @data_html_options_builder.add 'date_today_btn', value: 'linked'
    end

    def today_highlight
      @data_html_options_builder.add('date_today_highlight') if options[:today_highlight]
    end

    def calendar_weeks
      @data_html_options_builder.add('date_calendar_weeks') if options[:calendar_weeks]
    end

    def autoclose
      @data_html_options_builder.add('date_autoclose') if options[:autoclose]
    end

    def dates_disabled
      @data_html_options_builder.add('dates_disabled', value: [options[:dates_disabled]].flatten) if options[:dates_disabled]
    end

    def toggle_active
      @data_html_options_builder.add('date_toggle_active')
    end

    def display_mode
      @data_html_options_builder.add('date_start_view', value: views[options[:display_mode]]) if options[:display_mode]
    end

    def display_mode_min
      @data_html_options_builder.add('date_min_view_mode', value: views[options[:display_mode_min]]) if options[:display_mode_min]
    end

    def display_mode_max
      @data_html_options_builder.add('date_max_view_mode', value: views[options[:display_mode_max]]) if options[:display_mode_max]
    end

    def days_of_week_disabled
      @data_html_options_builder.add('date_days_of_week_disabled', value: [options[:days_of_week_disabled]].flatten) if options[:days_of_week_disabled]
    end

    def days_of_week_highlighted
      @data_html_options_builder.add('date_days_of_week_highlighted', value: [options[:days_of_week_highlighted]].flatten) if options[:days_of_week_highlighted]
    end

    def multiple
      @data_html_options_builder.add('date_multidate', value: options[:multiple])
    end

    # :lg, :sm or :xs
    def size
      "input-group-#{options[:size]}" if options[:size]
    end

    def status
      "has-#{options[:status]}" if options[:status]
    end

    def views
      {
        days: 0,
        months: 1,
        years: 2,
        decades: 3,
        centuries: 4
      }
    end
  end
end
