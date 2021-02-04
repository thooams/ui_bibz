# frozen_string_literal: true

module PopoverExtension
  # TOOLTIP_METHODS = %i[animation container delay html placement selector template title trigger
  #                     offset fallback_placement boundary sanitize white_list santitize_fn].freeze

  POPOVER_METHODS = %i[animation container delay html placement selector template title
                       trigger offset fallbackPlacement boundary sanitize white_list sanitize_fn].freeze

  def popover_data_html
    if options[:popover].present?
      add_html_data 'bs-toggle', value: 'popover'
      add_html_data 'bs-content', value: (options[:popover].is_a?(String) ? options[:popover] : options[:popover][:content])
    end

    return unless options[:popover].is_a?(Hash)

    POPOVER_METHODS.each { |mth| add_html_data("bs-#{mth}", value: options[:popover].try(:[], mth)) unless options[:popover].try(:[], mth).nil? }
    add_html_data 'bs-placement', value: options[:popover].try(:[], :position) unless options[:popover].try(:[], :position).nil?
  end

  def tooltip_data_html
    return if options[:tooltip].nil?

    html_options.update(generate_tooltip.render)
  end

  private

  def generate_tooltip
    case options[:tooltip].class.name
    when 'UiBibz::Ui::Core::Notifications::Tooltip'
      options[:tooltip]
    when 'TrueClass'
      UiBibz::Ui::Core::Notifications::Tooltip.new(html_options.delete(:title))
    else
      UiBibz::Ui::Core::Notifications::Tooltip.new(options[:tooltip])
    end
  end
end
