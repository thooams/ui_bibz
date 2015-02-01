module UiBibz::Ui
  class Breadcrumb < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @breadcrumb = Component.new content, options, html_options, &block
    end

    def render
      content_tag :ol, @breadcrumb.render, { class: @breadcrumb.cls("breadcrumb") }
    end

  end
end
