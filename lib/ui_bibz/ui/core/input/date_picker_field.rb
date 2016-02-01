module UiBibz::Ui::Core

  # Create a surround_field
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
  # * +num+ - Integer | 0..12
  # * +offset+ - Integer
  # * +size+ - Integer
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::SurroundField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::SurroundField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::SurroundField.new('search', prepend: 'Prepend content', append: 'Append content', class: 'test')
  #
  #   UiBibz::Ui::Core::SurroundField.new(prepend: glyph('pencil'), append: glyph('camera-retro')) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   surround_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class DatePickerField < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      date_locale
      provide
      date_format
      date_today_btn
      date_today_highlight
      @options[prepend_or_append] = UiBibz::Ui::Core::Glyph.new('calendar').render
      @html_options = class_and_html_options('date_picker')
    end

    # Render html tag
    def render
      UiBibz::Ui::Core::SurroundField.new(@content, @options, @html_options).render
    end

  private

    def date_locale
      @html_options = @html_options.merge({ "data-date-locale" => I18n.locale.to_s })
    end

    def provide
      @html_options = @html_options.merge({ "data-provide" => "datepicker"})
    end

    def date_format
      @html_options = @html_options.merge({ "data-date-format" => picker_pattern })
    end

    def picker_pattern
      I18n.t('datepicker.pformat', default: 'dd/mm/yyyy')
    end

    def date_today_btn
      @html_options = @html_options.merge({ "data-date-today-btn" => 'linked' })
    end

    def date_today_highlight
      @html_options = @html_options.merge({ "data-date-today-highlight" => true })
    end

    def prepend_or_append
      @options[:position] == :left ? :append : :prepend
    end

    # :lg, :sm or :xs
    def size
      "input-group-#{ @options[:size] }" if @options[:size]
    end

  end
end
