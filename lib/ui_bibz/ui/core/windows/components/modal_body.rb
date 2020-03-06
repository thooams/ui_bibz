# frozen_string_literal: true

module UiBibz::Ui::Core::Windows::Components
  # Create a modal body
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
  #   UiBibz::Ui::Core::ModalBody.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::ModalBody.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ModalBody.new.render
  #
  #   UiBibz::Ui::Core::ModalBody.new do
  #     'Exemple'
  #   end.render
  #
  class ModalBody < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      content_tag :div, content, html_options
    end

    private

    def component_html_classes
      'modal-body'
    end
  end
end
