# frozen_string_literal: true

module UiBibz::Ui::Core::Windows::Components
  # Create a modal footer
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
  #   UiBibz::Ui::Core::ModalFooter.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::ModalFooter.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ModalFooter.new.render
  #
  #   UiBibz::Ui::Core::ModalFooter.new do
  #     'Exemple'
  #   end.render
  #
  class ModalFooter < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, content, html_options
    end

    private

    def component_html_classes
      'modal-footer'
    end
  end
end
