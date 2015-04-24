module UiBibz::Ui

  # Create DropdownList
  #
  # This element is an extend of UiBibz::Ui::Component.
  # Use '---' in content to add a separator
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
  # * +status+ - State of élement with symbol value:
  #   (+:active+)
  # * +url+ - String
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::DropdownList.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::DropdownList.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::DropdownList.new('Home', { glyph: 'home', status: :active },{ class: 'test' })
  #
  #   UiBibz::Ui::DropdownList.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     'Home'
  #   end
  #
  #   UiBibz::UiBibz::DropdownList.new('---') # To add a separator
  #
  class DropdownList < Component

    DIVIDER = '---'

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      @content == DIVIDER ? divider_html : link_html
    end

  private

    def divider_html
      content_tag :li, '', class_and_html_options('divider').merge({ role: 'presentation' })
    end

    def link_html
      content_tag :li, class_and_html_options(type).merge({ role: 'presentation' }) do
        @content
      end
    end

    def type
      "dropdown-header" if @options[:type] == :header
    end

  end
end
