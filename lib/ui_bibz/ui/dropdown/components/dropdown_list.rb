module UiBibz::Ui
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
