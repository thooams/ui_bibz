# frozen_string_literal: true

require 'ui_bibz/ui/extensions/core/forms/connect_extension'
module UiBibz::Ui::Core::Forms::Buttons
  # Create a Button Refrash
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
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+, +:link+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +type+ - Symbol (+:outline)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  # * +connect+ - Hash
  #   * +event+ - String
  #   * +mode+ - String
  #   * +target+ - Hash
  #     * +selector+ - String
  #     * +data+ - Array
  #     * +url+ - String
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Buttons::RefreshButton.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Buttons::RefreshButton.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Buttons::RefreshButton.new('test', type: :primary, size: :xs).render
  #
  #   UiBibz::Ui::Core::Forms::Buttons::RefreshButton.new(type: :primary) do
  #     test
  #   end.render
  #
  class ButtonRefresh < UiBibz::Ui::Core::Forms::Buttons::Button
    include ConnectExtension

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    def pre_render
      button_refresh_html_tag
    end

    private

    def button_refresh_html_tag
      content_tag :span, glyph_and_content_html, html_options
    end

    def component_options
      options[:connect] = cnt_opts
      super.merge({ glyph: 'sync-alt', status: options[:status] })
    end

    def component_html_classes
      super << %w[input-refresh-button btn]
    end

    def cnt_opts
      {
        events: options[:connect].try(:[], :events) || 'click',
        mode: options[:connect].try(:[], :mode) || 'remote',
        target: {
          selector: options[:connect].try(:[], :target).try(:[], :selector) || '',
          url: options[:connect].try(:[], :target).try(:[], :url) || '',
          data: options[:connect].try(:[], :target).try(:[], :data) || []
        }
      }
    end

    def status
      "btn-#{options[:status] || :secondary}"
    end
  end
end
