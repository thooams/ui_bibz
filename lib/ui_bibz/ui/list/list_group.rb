module UiBibz::Ui
  class ListGroup < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @list_group = Component.new content, options, html_options, &block
    end

    def render
      content_tag tag, @list_group.render, { class: @list_group.cls("list-group") }
    end

    def tag
      @list_group.options[:tag] || :ul
    end

  end
end
