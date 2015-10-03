module UiBibz::Ui::Core

  # Create a textfield
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
  #   UiBibz::Ui::Core::Textfield.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Textfield.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Textfield.new({num: 2, offset: 1, size: 3}, class: 'test') do
  #     #content
  #   end
  #
  #   UiBibz::Ui::Core::Textfield.new([{num: 2, offset: 1, size: 3}, { num: 3}], class: 'test') do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   textfield(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class Textfield < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, class: 'input-group' do
        concat content_tag :span, @options[:append], class: 'input-group-addon' unless @options[:append].nil?
        concat text_field_tag @content, @html_options[:value], class_and_html_options('form-control')
        concat content_tag :span, @options[:prepend], class: 'input-group-addon' unless @options[:prepend].nil?
      end
    end

  end
end
