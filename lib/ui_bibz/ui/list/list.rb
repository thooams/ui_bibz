module UiBibz::Ui
  class List < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @list = Component.new content, options, html_options, &block
    end

    def render
      content_tag tag, @list.render, class_and_html_options
    end

    def tag
      @list.options[:tag] || :li
    end

    def class_and_html_options
      html_options = {}
      html_options = @list.class_and_html_options('list-group-item')
      html_options = @list.class_and_html_options('active') if @list.options[:active]
      html_options
    end

  end
end
