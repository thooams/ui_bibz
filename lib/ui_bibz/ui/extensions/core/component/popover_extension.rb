# frozen_string_literal: true

module PopoverExtension
  def popover_data_html
    return if options[:popover].nil?

    html_options.update(generate_popover.render)
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

  def generate_popover
    case options[:popover].class.name
    when 'UiBibz::Ui::Core::Notifications::Popover'
      options[:popover]
    else
      UiBibz::Ui::Core::Notifications::Popover.new(options[:popover])
    end
  end
end
