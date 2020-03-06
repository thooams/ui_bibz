# frozen_string_literal: true

module UiBibz::Ui::Core::Notifications
  # Create a spinner
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
  #   (+:primary+, +:secondary+, +:success+, +:danger+, +:warning+, +:info+, +:light+, +:dark+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +type+
  #   (+:border+, +:grow+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Notifications::Spinner.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::Spinner.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::Spinner.new(content, status: :success, type: :pill).render
  #
  #   UiBibz::Ui::Core::Notifications::Spinner.new() do
  #     #content
  #   end.render
  #
  # ==== Helper
  #
  #   ui_spinner(content, options = {}, html_options = {})
  #
  #   ui_spinner(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Spinner < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      content_tag tag_html, html_options do
        content_tag :span, @content || 'Loading...', class: 'sr-only'
      end
    end

    private

    def component_html_options
      super.merge({ role: 'status' })
    end

    def component_html_classes
      ["spinner-#{type}", status, size]
    end

    def status
      "text-#{@options[:status] || :secondary}" if options[:status]
    end

    def type
      @options[:type] || 'border'
    end

    def size
      "spinner-#{type}-#{options[:size]}" if options[:size]
    end

    def tag_html
      options[:tag] || :div
    end
  end
end
