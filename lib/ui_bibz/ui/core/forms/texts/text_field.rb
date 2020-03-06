# frozen_string_literal: true

require 'ui_bibz/ui/extensions/core/forms/surround_extension'
module UiBibz::Ui::Core::Forms::Texts
  # Create a TextField
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
  # * +prepend+ - String, Html
  # * +append+ - String, Html
  # * +state+ - Symbol
  #   (+:active+, +:disabled+)
  # String, Html
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Texts::TextField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Texts::TextField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Texts::TextField.new('search', prepend: 'Prepend content', append: 'Append content', class: 'test')
  #
  #   UiBibz::Ui::Core::Forms::Texts::TextField.new(prepend: glyph('pencil'), append: glyph('camera-retro')) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   text_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class TextField < UiBibz::Ui::Core::Component
    include SurroundExtension

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      surround_field text_field_input_tag
    end

    private

    # Simple_form or not
    def text_field_input_tag
      text_field_tag content, options[:value] || html_options[:value], html_options
    end

    # Todo
    def component_options
      options[:status].nil? ? super : super.merge({ surrounded: true })
    end

    def component_html_classes
      super << ['form-control', status, size]
    end

    def component_html_options
      options[:state] == :disabled ? { disabled: 'disabled' } : {}
    end
    62 + 9
    def status
      "form-control-#{options[:status]}" unless options[:status].nil?
    end

    def size
      "form-control-#{options[:size]}" unless options[:size].nil?
    end
  end
end
