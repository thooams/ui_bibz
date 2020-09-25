# frozen_string_literal: true

require 'ui_bibz/ui/core/windows/components/modal_header'
require 'ui_bibz/ui/core/windows/components/modal_body'
require 'ui_bibz/ui/core/windows/components/modal_footer'
module UiBibz::Ui::Core::Windows
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
  # * +size+
  #   (+:xl:,+:lg+, +:md+, +:sm+)
  # * +fullscreen+ - Boolean
  # * +backdrop+ - Symbol (+:static+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Modal.new(options = nil, html_options = nil) do  |m|
  #     m.header content, options, html_options, &block
  #     m.body content, options, html_options, &block
  #     m.footer content, options, html_options, &block
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Modal.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do |m|
  #     m.header 'Title'
  #     m.body 'Content'
  #     m.footer do
  #       button_link 'Ok', '#', class: :success
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   modal(options = {}, html_options = {}) do |m|
  #     m.header do
  #       'Title'
  #     end
  #     m.body do
  #       'Content'
  #     end
  #     m.footer do
  #       'Footer'
  #     end
  #   end
  #
  class Modal < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, modal_html_options do
        content_tag :div, class: modal_dialog_classes do
          content_tag :div, class: 'modal-content' do
            concat @header&.render
            concat @body&.render
            concat @footer&.render
          end
        end
      end
    end

    def header(content = nil, options = nil, html_options = nil, &block)
      @header = UiBibz::Ui::Core::Windows::Components::ModalHeader.new(content, options, html_options, &block)
    end

    def footer(content = nil, options = nil, html_options = nil, &block)
      @footer = UiBibz::Ui::Core::Windows::Components::ModalFooter.new(content, options, html_options, &block)
    end

    def body(content = nil, options = nil, html_options = nil, &block)
      @body = UiBibz::Ui::Core::Windows::Components::ModalBody.new(content, options, html_options, &block)
    end

    private

    def modal_dialog_classes
      UiBibz::Utils::Screwdriver.join_classes('modal-dialog', size, position, scrollable)
    end

    def component_html_classes
      'modal'
    end

    def scrollable
      'modal-dialog-scrollable' if @options[:scrollable]
    end

    # centered
    def position
      "modal-dialog-#{@options[:position]}" if @options[:position]
    end

    # :xl, :lg, :sm or :xs
    def size
      [modal, fullscreen, @options[:size], down].compact.join('-')
    end

    def fullscreen
      'fullscreen' if @options[:fullscreen]
    end

    def effect
      @options[:effect] unless @options[:effect].nil?
    end

    def down
      'down' if @options[:size] && @options[:fullscreen]
    end

    def modal
      'modal' if @options[:size] || @options[:fullscreen]
    end

    # Update html_options only during pre-render
    def modal_html_options
      html_options.merge({ tabindex: '-1', aria: { labelledby: labelled_by, hidden: 'true' } })
    end

    def component_html_data
      super
      backdrop
    end

    def labelled_by
      sanitize(@header&.content || 'Modal', tags: [], attributes: [])
    end

    def backdrop
      return unless @options[:backdrop]

      add_html_data 'backdrop', value: @options[:backdrop]
      add_html_data 'keyboard', value: 'false'
    end
  end
end
