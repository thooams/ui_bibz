require 'ui_bibz/ui/core/modal/components/modal_header'
require 'ui_bibz/ui/core/modal/components/modal_body'
require 'ui_bibz/ui/core/modal/components/modal_footer'
module UiBibz::Ui::Core

  # Create an modal
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
  # * +state+ - State of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Modal.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Modal.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Modal.new(content, { state: :success, glyph: 'eye' },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Modal.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     content
  #   end.render
  #
  # ==== Helper
  #
  #   modal(content, options = {}, html_options = {})
  #
  #   modal(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Modal < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, class_and_html_options(['modal', effect]) do
        content_tag :div, class: 'modal-dialog', role: 'document' do
          content_tag :div, class: 'modal-content' do
            concat @header
            concat @body
            concat @footer
          end
        end
      end
    end

    def header content = nil, options = nil, html_options = nil, &block
      @header = ModalHeader.new(content, options, html_options, &block).render
    end

    def footer content = nil, options = nil, html_options = nil, &block
      @footer = ModalFooter.new(content, options, html_options, &block).render
    end

    def body content = nil, options = nil, html_options = nil, &block
      @body = ModalBody.new(content, options, html_options, &block).render
    end

    private

    def effect
      @options[:effect] unless @options[:effect].nil?
    end

  end
end
