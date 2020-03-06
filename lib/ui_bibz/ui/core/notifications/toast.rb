# frozen_string_literal: true

require 'ui_bibz/ui/core/notifications/components/toast_header'
require 'ui_bibz/ui/core/notifications/components/toast_body'
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
  #   UiBibz::Ui::Core::Toast.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Toast.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Toast.new(class: 'my-toast').tap |t|
  #     t.header "My header toast", glyph: 'eye', time: 'now'
  #     t.body "My body toast"
  #   end
  #
  #   UiBibz::Ui::Core::Toast.new(class: 'my-toast').tap |t|
  #     t.header glyph: 'eye', time: 'now' do
  #       My header toast
  #     end
  #     t.body class: 'my-body-toast' do
  #       My body toast
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   ui_toast(options = { tap: true }, html_options = {}) do |t|
  #     t.header "My header toast", glyph: 'eye', time: 'now'
  #     t.body "My body toast"
  #   end
  #
  class Toast < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat @header
        concat @body
      end
    end

    # Add Header which is a component
    def header(content = nil, options = nil, html_options = nil, &block)
      @header = UiBibz::Ui::Core::Notifications::Components::ToastHeader.new(content, options, html_options, &block).render
    end

    # Add Body which is a component
    def body(content = nil, options = nil, html_options = nil, &block)
      @body = UiBibz::Ui::Core::Notifications::Components::ToastBody.new(content, options, html_options, &block).render
    end

    private

    def component_html_classes
      super << 'toast'
    end

    def component_html_options
      { role: 'alert', "aria-live": 'assertive', "aria-atomic": true }
    end

    def component_html_data
      super
      add_html_data 'autohide', options[:auto_hide] if options[:auto_hide]
    end
  end
end
