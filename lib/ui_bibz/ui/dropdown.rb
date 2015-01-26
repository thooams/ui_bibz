module UiBibz::Ui
  class Dropdown < Ui

    def initialize name, options = nil, html_options  = nil, &block
      @name         = name
      @options      = options || {}
      @html_options = html_options || {}
      @block        = block
    end

    def render
      button = [glyph, @name, caret].compact.join.html_safe
      content_tag :div, class: cls('dropdown') do
        concat content_tag :button, button, class: 'btn btn-default dropdown-toggle', type: 'button', "data-toggle" => 'dropdown', "aria-expanded" => false
        concat content_tag(:ul, @block.call, class: "dropdown-menu dropdown-menu-#{ position }", "role" => 'menu')
      end
    end

  private

    def glyph
      Glyph.new(@options[:glyph]).render unless @options[:glyph].nil?
    end

    def html_options
      @html_options || {}
    end

    def caret
      content_tag :span, '', class: 'caret'
    end

    def separator
      content_tag :li, '', class: 'divider', role: 'presentation'
    end

    def position
      (@options[:position] || 'left').to_s
    end

    def cls klass
      [html_options.delete(:class), klass].compact.join(' ')
    end

  end
end
