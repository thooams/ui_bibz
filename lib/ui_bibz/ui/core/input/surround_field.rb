module UiBibz::Ui::Core

  # Create a surround_field
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
  # * +num+ - Integer | 0..12
  # * +offset+ - Integer
  # * +size+ - Integer
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::SurroundField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::SurroundField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::SurroundField.new('search', prepend: 'Prepend content', append: 'Append content', class: 'test')
  #
  #   UiBibz::Ui::Core::SurroundField.new(prepend: glyph('pencil'), append: glyph('camera-retro')) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   surround_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class SurroundField < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      if @options[:append].nil? && @options[:prepend].nil?
        text_field_tag @content, @html_options[:value], class_and_html_options('form-control')
      else
        content_tag :div, class: add_classes('input-group', size) do
          concat content_tag :span, @options[:append], class: 'input-group-addon' unless @options[:append].nil?
          concat text_field_tag @content, @html_options[:value], class_and_html_options('form-control')
          concat content_tag :span, @options[:prepend], class: 'input-group-addon' unless @options[:prepend].nil?
        end
      end
    end

    private

    # :lg, :sm or :xs
    def size
      "input-group-#{ @options[:size] }" if @options[:size]
    end

  end
end
