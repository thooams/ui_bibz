module UiBibz::Ui
  class LinkAction < Ui

    # Creates a link for actions in grid
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
      @link_action = Component.new content, options, html_options, &block
    end

    def render
      html_options = class_and_options_in_html_options
      if @link_action.content == '---'
        content_tag :li, '', role: 'presentation', class: 'divider'
      else
        content_tag :li, role: 'presentation' do
          link_to @link_action.render, @link_action.options, html_options
        end
      end
    end

    def class_and_options_in_html_options
      @link_action.options_in_html_options({ role: "menuitem", tabindex: "-1", glyph: glyph_info })
    end

    def glyph_info
      glyph_info = @link_action.html_options[:glyph]
      unless glyph_info.nil?
        if glyph_info.kind_of?(String)
          infos = { name: glyph_info, type: 'fw' }
        else
          infos = glyph_info.merge({ type: 'fw' }) if glyph_info[:type].nil?
        end
        @link_action.html_options[:glyph] = infos
      end
    end
  end
end
