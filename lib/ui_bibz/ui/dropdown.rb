module UiBibz::Ui
  class Dropdown < Ui

    def initialize name, options = nil, html_options = nil, &block
      @name, @options, @html_options, @block = name, options, html_options, block
    end

    def render
      content_tag :div, class: cls('dropdown') do
        concat content_tag :button, (@name + caret).html_safe, class: 'btn btn-default dropdown-toggle', type: 'button', "data-toggle" => 'dropdown', "aria-expanded" => false
        concat content_tag(:ul, @block.call, class: "dropdown-menu dropdown-menu-#{ position }", "role" => 'menu')
      end
    end

  private

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
