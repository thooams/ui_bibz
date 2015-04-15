module UiBibz::Ui
  class TableAction < Component

    DIVIDER = '---'

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      @content == DIVIDER ? DIVIDER : link_html
    end

  private

    def link_html
      link_to glyph_and_content_html, @options[:url], class_and_html_options
    end

  end
end
