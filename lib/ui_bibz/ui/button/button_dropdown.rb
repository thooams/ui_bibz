module UiBibz::Ui
  class ButtonDropdown < Component

    def initialize name, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, class: 'btn-group' do
        concat content_tag :button, (@name + caret).html_safe , class: cls('btn btn-default dropdown-toggle'), type: 'button', "data-toggle" => 'dropdown', "aria-expanded" => false
        concat content_tag(:ul, @block.call, class: 'dropdown-menu', "role" => 'menu')
      end
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

    def cls klass
      [html_options.delete(:class), klass].compact.join(' ')
    end

  end
end
