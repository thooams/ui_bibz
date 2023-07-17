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
  #   UiBibz::Ui::Core::Notifications::Toast.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::Toast.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::Toast.new(class: 'my-toast').tap |t|
  #     t.header "My header toast", glyph: 'eye', time: 'now'
  #     t.body "My body toast"
  #   end
  #
  #   UiBibz::Ui::Core::Notifications::Toast.new(class: 'my-toast').tap |t|
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
  #   ui_toast(options = {}, html_options = {}) do |t|
  #     t.header "My header toast", glyph: 'eye', time: 'now'
  #     t.body "My body toast"
  #   end
  #
  class Toast < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &)
      super
      body(@content) unless @tapped
    end

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat @header
        concat @body
      end
    end

    # Add Header which is a component
    def header(content = nil, options = nil, html_options = nil, &)
      @header = UiBibz::Ui::Core::Notifications::Components::ToastHeader.new(content, options, html_options, &).render
    end

    # Add Body which is a component
    def body(content = nil, options = nil, html_options = nil, &)
      @body = if @header.nil?
                content_tag :div, class: 'd-flex' do
                  concat UiBibz::Ui::Core::Notifications::Components::ToastBody.new(content, options, html_options, &).render
                  concat close_html if (options || {})[:closable]
                end
              else
                UiBibz::Ui::Core::Notifications::Components::ToastBody.new(content, options, html_options, &).render
              end
    end

    private

    def only_body_html
      @body = UiBibz::Ui::Core::Notifications::Components::ToastBody.new(content, options, html_options, &block).render
    end

    def close_html
      content_tag :button, '', type: 'button', class: close_button_classes,
                               'data-bs-dismiss' => 'toast', 'aria-label' => 'Close'
    end

    def component_html_classes
      super << ['toast', status, white_text_color, align_items_center]
    end

    def component_html_options
      { role: 'alert', 'aria-live': 'assertive', 'aria-atomic': true }
    end

    def component_html_data
      super
      add_html_data 'bs-autohide', value: options[:auto_hide] if options[:auto_hide]
    end

    def status
      "bg-#{options[:status]}" if options[:status]
    end

    def align_items_center
      'align-items-center' if @header.nil?
    end

    def white_text_color
      return if options[:status].nil?

      'text-white' unless %i[info warning info light].include?(options[:status])
    end

    def white_btn_color
      return if options[:status].nil?

      'btn-close-white' unless %i[info warning info light].include?(options[:status])
    end

    def close_button_classes
      UiBibz::Utils::Screwdriver.join_classes('btn-close', 'me-2', 'm-auto', white_btn_color)
    end
  end
end
