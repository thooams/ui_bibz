# frozen_string_literal: true
# # frozen_string_literal: true
#
# module PopoverExtension
#   # Add popover to a component
#   #
#   # By tooltip object
#   #
#   #   popover = UiBibz::Ui::Core::Notifications::Popover.new("My Popover")
#   #   UiBibz::Ui::Core::Component.new("My content", popover: popover)
#   #
#   # By Hash
#   #
#   #   UiBibz::Ui::Core::Component.new("My content", popover: { content: "My Popover" })
#   #
#   # By String
#   #
#   #   UiBibz::Ui::Core::Component.new("My content", popover: "My Popover")
#   #
#   def popover_data_html
#     return if options[:popover].nil?
#
#     html_options.update(generate_popover.render)
#   end
#
#   # Add tooltip to a component
#   #
#   # By tooltip object
#   #
#   #   tooltip = UiBibz::Ui::Core::Notifications::Tooltip.new("My tooltip")
#   #   UiBibz::Ui::Core::Component.new("My content", tooltip: tooltip)
#   #
#   # By Boolean
#   #
#   #   UiBibz::Ui::Core::Component.new("My content", tooltip: true)
#   #   # or
#   #   UiBibz::Ui::Core::Component.new("My content", {tooltip: true}, { title: 'My tooltip' })
#   #
#   # By Hash
#   #
#   #   UiBibz::Ui::Core::Component.new("My content", tooltip: { title: 'My tooltip' })
#   #
#   def tooltip_data_html
#     return if options[:tooltip].nil?
#
#     html_options.update(generate_tooltip.render)
#   end
#
#   private
#
#   def generate_tooltip
#     case options[:tooltip].class.name
#     when 'UiBibz::Ui::Core::Notifications::Tooltip'
#       options[:tooltip]
#     when 'TrueClass'
#       tooltip_content = html_options.delete(:title) || (sanitize_text(content) if options[:text] == false)
#       UiBibz::Ui::Core::Notifications::Tooltip.new(tooltip_content)
#     else
#       UiBibz::Ui::Core::Notifications::Tooltip.new(options[:tooltip])
#     end
#   end
#
#   def generate_popover
#     case options[:popover].class.name
#     when 'UiBibz::Ui::Core::Notifications::Popover'
#       options[:popover]
#     else
#       UiBibz::Ui::Core::Notifications::Popover.new(options[:popover])
#     end
#   end
# end
