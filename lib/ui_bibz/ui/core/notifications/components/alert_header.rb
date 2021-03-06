# frozen_string_literal: true

module UiBibz::Ui::Core::Notifications::Components
  # Create a alert body
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Notifications::AlertHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Notifications::AlertHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Notifications::AlertHeader.new.render
  #
  #   UiBibz::Ui::Core::Notifications::AlertHeader.new do
  #     'Exemple'
  #   end.render
  #
  class AlertHeader < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    def pre_render
      if options[:tap] == false
        html_content
      else
        content_tag :h4, html_content, html_options
      end
    end

    private

    def component_html_classes
      'alert-header'
    end

    def html_content
      output = [glyph_and_content_html]
      output << close_html if options[:closable]
      output.join.html_safe
    end

    def close_html
      content_tag :button, '', type: 'button', class: 'btn-close', 'data-bs-dismiss' => 'alert', 'aria-label' => 'Close'
    end
  end
end
