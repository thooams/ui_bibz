module UiBibz::Ui
  class Tab < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @tab = Component.new content, options, html_options, &block
    end

    def render
      content_tag :li, content, { role: 'presentation' }.merge(class_and_options)
    end

    def content
      content_tag :a, @tab.render
    end

    def class_and_options
      @tab.html_options[:class] = [@tab.html_options.fetch(:class), 'active'].compact.join(' ') if @tab.options[:active]
      @tab.html_options
    end

  end
end
