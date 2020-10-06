# frozen_string_literal: true

module UiBibz::Ui::Core::Windows::Components
  # Create a modal header
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
  #   UiBibz::Ui::Core::ModalHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CarHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ModalHeader.new.render
  #
  #   UiBibz::Ui::Core::ModalHeader.new do
  #     'Exemple'
  #   end.render
  #
  class ModalHeader < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat content_tag :h5, glyph_and_content_html, class: 'modal-title'
        concat close_button_html
      end
    end

    private

    def component_html_classes
      'modal-header'
    end

    def close_button_html
      content_tag :button, '', class: 'close', 'data-dismiss' => 'modal', 'aria-label' => 'Close'
    end
  end
end
