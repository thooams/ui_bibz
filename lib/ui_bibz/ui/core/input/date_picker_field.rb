module UiBibz::Ui::Core

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
  # * +date_today_highlight+ - Boolean
  # * +calendar_weeks+ - Boolean
  # * +date_disabled+ - Array, String
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::DatePickerField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::DatePickerField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::DatePickerField.new('date', { prepend: 'Prepend content', append: 'Append content' }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::DatePickerField.new({ date_today_highlight: true, calendar_weeks: true, range: 'to' }, { class: 'test' }) do
  #     'date'
  #   end
  #
  # ==== Helper
  #
  #   date_picker_field(content, options = {}, html_options = {})
  #
  class DatePickerField < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @html_options = class_and_html_options('date_picker')
    end

    # Render html tag
    def render
      if @options[:range]
        content_tag :div, class: add_classes('input-group', 'input-daterange', size) do
          concat content_tag :span, @options[:append], class: 'input-group-addon' unless @options[:append].nil?
          concat text_field_tag @content, @html_options[:value], class_and_html_options('form-control')
          concat content_tag :span, @options[:range], class: 'input-group-addon input-group-range'
          concat text_field_tag @content, @html_options[:value], class_and_html_options('form-control')
          concat content_tag :span, @options[:prepend], class: 'input-group-addon' unless @options[:prepend].nil?
        end
      else
        UiBibz::Ui::Core::SurroundField.new(@content, @options, @html_options).render
      end
    end

  private

    def add_data_html_options
      date_locale
      provide
      date_format
      date_today_btn
      date_today_highlight
      calendar_weeks
      autoclose
      dates_disabled
    end

    def date_locale
      add_html_data "date_locale", I18n.locale.to_s
    end

    def provide
      add_html_data "provide", 'datepicker'
    end

    def date_format
      add_html_data "date_format", picker_pattern
    end

    def picker_pattern
      I18n.t('datepicker.pformat', default: 'dd/mm/yyyy')
    end

    def date_today_btn
      add_html_data 'date_today_btn', 'linked'
    end

    def date_today_highlight
      add_html_data('date_today_highlight') if @options[:date_today_highlight]
    end

    def calendar_weeks
      add_html_data("calendar_weeks") if @options[:calendar_weeks]
    end

    def autoclose
      add_html_data("autoclose") if @options[:autoclose]
    end

    def dates_disabled
      add_html_data("dates_disabled", [@options[:dates_disabled]].flatten) if @options[:dates_disabled]
    end

    # :lg, :sm or :xs
    def size
      "input-group-#{ @options[:size] }" if @options[:size]
    end

  end
end
