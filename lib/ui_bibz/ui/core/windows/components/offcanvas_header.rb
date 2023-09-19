# frozen_string_literal: true

module UiBibz::Ui::Core::Windows::Components
  # Create a offcanvas header
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
  #   UiBibz::Ui::Core::OffcanvasHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CarHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::OffcanvasHeader.new.render
  #
  #   UiBibz::Ui::Core::OffcanvasHeader.new do
  #     'Exemple'
  #   end.render
  #
  class OffcanvasHeader < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat content_tag :h5, glyph_and_content_html, class: 'offcanvas-title'
        concat close_button_html
      end
    end

    private

    def component_html_classes
      'offcanvas-header'
    end

    def close_button_html
      content_tag :button, '', class: 'btn-close', 'data-bs-dismiss' => 'offcanvas', 'aria-label' => 'Close'
    end
  end
end
