module UiBibz::Ui
  class ButtonGroup < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @group_button = Component.new content, options, html_options, &block
    end

    def render
      content_tag :div, @group_button.render, { class: @group_button.cls("btn-group") }
    end

  end
end
