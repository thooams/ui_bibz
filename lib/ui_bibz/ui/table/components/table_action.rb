module UiBibz::Ui
  class TableAction < Component

    DIVIDER = '---'

    # Creates a link for actions in table
    #
    # ==== Signatures
    #
    #   LinkAction.new(name, url, html_options = {})
    #   eq. LinkAction.new('Show', user_path, glyph: 'eye')
    #
    #   LinkAction.new(url, html_options = {}) do
    #     # content
    #   end
    #
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
      content_tag :li, role: 'presentation' do
        link_to glyph_and_content_html, @options[:url], class_and_html_options
      end
    end

  end
end
