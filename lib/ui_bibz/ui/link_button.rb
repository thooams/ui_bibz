module UiBibz::Ui
  class LinkButton < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @link_button = Component.new content, options, html_options, &block
    end

    def render
      link_to @link_button.render, @link_button.options,  { class: @link_button.cls("btn") }
    end

  end
end
