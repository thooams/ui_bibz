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
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def pre_render
      if options[:tap]
        content_tag :h4, html_content, html_options
      else
        html_content
      end
    end

  private

    def component_html_classes
      "alert-header"
    end

    def html_content
      output = [glyph_and_content_html]
      output << close_html if options[:closable]
      output.join.html_safe
    end

    def close_html
      content_tag :button, type: 'button', class: 'close', "data-dismiss" => "alert", "aria-label" => "Close" do
        concat content_tag :span, "×", "aria-hidden" => true
        concat content_tag :span, "Close", class: "sr-only"
      end
    end

  end
end
