# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Textareas
  # Create a MarkdownEditorField
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
  #
  # * +state+ - (:disabled, :active)
  # * +autofocus+ - Boolean
  # * +savable+ - Boolean
  # * +hideable+ - Boolean
  # * +hidden_buttons+ - (Array || String)
  # * +disabled_buttons+ - (Array || String)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new('search', prepend: 'Prepend content', append: 'Append content', class: 'test')
  #
  #   UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new(prepend: glyph('pencil'), append: glyph('camera-retro')) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   markdown_editor_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class MarkdownEditorField < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      text_area_tag content, options[:value] || html_options[:value], html_options
    end

    private

    def component_html_data
      super
      provide
      autofocus
      savable
      hideable
      icon_library
      hidden_buttons
      disabled_buttons
    end

    def provide
      add_html_data('provide', 'markdown')
    end

    def autofocus
      add_html_data('autofocus') if options[:autofocus]
    end

    def savable
      add_html_data('savable') if options[:savable]
    end

    def hideable
      add_html_data('hideable') if options[:hideable]
    end

    def icon_library
      add_html_data('iconlibrary', 'fa-5')
    end

    def hidden_buttons
      add_html_data('hiddenButtons', options[:hidden_buttons]) if options[:hidden_buttons]
    end

    def disabled_buttons
      add_html_data('disabledButtons', options[:disabled_buttons]) if options[:disabled_buttons]
    end

    def status
      "has-#{options[:status]}" if options[:status]
    end

    def component_html_options
      options[:state] == :disabled ? { disabled: 'disabled' } : {}
    end
  end
end
