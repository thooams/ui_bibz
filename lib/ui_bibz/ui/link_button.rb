module UiBibz::Ui
  class LinkButton < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @link_button = Component.new content, options, html_options, &block
    end

    def render
      link_to @link_button.render, @link_button.options, class_and_html_options
    end

    def type
      @link_button.html_options[:type] || 'btn-default'
    end

    def class_and_html_options
      @link_button.class_and_html_options(["btn", type])
    end

  end
end
