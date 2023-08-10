# frozen_string_literal: true

require 'ui_bibz/ui/core/notifications/components/alert_header'
require 'ui_bibz/ui/core/notifications/components/alert_body'
module UiBibz::Ui::Core::Notifications
  # Create an alert
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
  # * +status+ - status of element with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +glyph+ - [String | Hash] Add glyph with name or hash options
  #   * +name+ - [String]
  #   *+timeout+ - [Integer]
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Alert.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Alert.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Alert.new(content, { status: :success, glyph: 'eye' },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Alert.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     content
  #   end.render
  #
  # ==== Helper
  #
  #   notify(content, options = {}, html_options = {})
  #
  #   notify(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Alert < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(...)
      super
      header(@content, tap: false) unless @tapped
    end

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat @header
        concat @body unless @body.nil?
      end
    end

    # Add Header which is a component
    def header(content = nil, options = nil, html_options = nil, &block)
      if block.nil?
        options = @options.merge(options || {})
      else
        content = @options.merge(content || {})
      end

      @header = UiBibz::Ui::Core::Notifications::Components::AlertHeader.new(content, options, html_options, &block).render
    end

    # Add Body which is a component
    def body(content = nil, options = nil, html_options = nil, &)
      @body = UiBibz::Ui::Core::Notifications::Components::AlertBody.new(content, options, html_options, &).render
    end

    private

    def component_html_data
      super
      add_html_data 'timeout', value: options[:timeout] if options[:timeout]
    end

    def component_html_classes
      %w[alert alert-dismissible]
    end

    def component_html_options
      { role: 'alert' }
    end

    def status
      "alert-#{options[:status] || :info}"
    end
  end
end
