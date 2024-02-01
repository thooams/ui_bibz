# frozen_string_literal: true

module UiBibz::Builders
  # Class to build html classes
  class DataHtmlOptionsBuilder
    include ActionView::Helpers::SanitizeHelper
    attr_accessor :html_options
    attr_reader :options, :content

    def initialize(content, options, html_options)
      @content = content
      @options = options
      @html_options = html_options

      stimulus_data_html
      hotwire_data_html
      tooltip_data_html
      popover_data_html
    end

    # Add html data arguments
    def add(name, value: true)
      return if value.blank? && value != false

      html_options[:data] = {} if html_options[:data].nil?
      value = value.strip if value.is_a?(String)
      html_options[:data].update({ name => value })
    end

    alias output html_options

    private

    def stimulus_data_html
      data_target = html_options.try(:[], :data).try(:[], :target) || options.try(:delete, :target)
      add(:target, value: data_target) unless data_target.nil?

      data_controller = html_options.try(:[], :data).try(:[], :controller) || options.try(:delete, :controller)
      add(:controller, value: data_controller) unless data_controller.nil?

      data_action = html_options.try(:[], :data).try(:[], :action) || options.try(:delete, :action)
      add(:action, value: data_action) unless data_action.nil?
    end

    def hotwire_data_html
      # To turbolinks
      data_turbolinks = html_options.try(:[], :data).try(:[], :turbolinks) || options.try(:delete, :turbolinks)
      add(:turbolinks, value: data_turbolinks) unless data_turbolinks.nil?

      # To Turbo
      data_turbo = html_options.try(:[], :data).try(:[], :turbo) || options.try(:delete, :turbo)
      add(:turbo, value: data_turbo) unless data_turbo.nil?
    end

    # Add popover to a component
    #
    # By tooltip object
    #
    #   popover = UiBibz::Ui::Core::Notifications::Popover.new("My Popover")
    #   UiBibz::Ui::Core::Component.new("My content", popover: popover)
    #
    # By Hash
    #
    #   UiBibz::Ui::Core::Component.new("My content", popover: { content: "My Popover" })
    #
    # By String
    #
    #   UiBibz::Ui::Core::Component.new("My content", popover: "My Popover")
    #
    def popover_data_html
      return if options[:popover].nil?

      html_options.update(generate_popover.render)
    end

    # Add tooltip to a component
    #
    # By tooltip object
    #
    #   tooltip = UiBibz::Ui::Core::Notifications::Tooltip.new("My tooltip")
    #   UiBibz::Ui::Core::Component.new("My content", tooltip: tooltip)
    #
    # By Boolean
    #
    #   UiBibz::Ui::Core::Component.new("My content", tooltip: true)
    #   # or
    #   UiBibz::Ui::Core::Component.new("My content", {tooltip: true}, { title: 'My tooltip' })
    #
    # By Hash
    #
    #   UiBibz::Ui::Core::Component.new("My content", tooltip: { title: 'My tooltip' })
    #
    def tooltip_data_html
      return if options[:tooltip].nil?

      html_options.update(generate_tooltip.render)
    end

    def generate_tooltip
      case options[:tooltip].class.name
      when 'UiBibz::Ui::Core::Notifications::Tooltip'
        options[:tooltip]
      when 'TrueClass'
        tooltip_content = html_options.delete(:title) || (sanitize(content) if options[:text] == false)
        UiBibz::Ui::Core::Notifications::Tooltip.new(tooltip_content)
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
end
