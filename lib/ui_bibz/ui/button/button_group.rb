module UiBibz::Ui
  class ButtonGroup < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, @content, class_and_html_options("btn-group")
    end

  end
end
