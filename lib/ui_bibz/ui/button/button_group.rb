module UiBibz::Ui
  class ButtonGroup < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, @content, class_and_html_options(["btn-group", size, position]).merge({ role: 'role' })
    end

  private

    def type
      @options[:type] || :button
    end

    def size
      "btn-group-#{ @options[:size] }" if @options[:size]
    end

    def position
      "btn-group-#{ @options[:position] }" if @options[:position]
    end

  end
end
