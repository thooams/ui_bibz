module UiBibz::Ui
  class ButtonGroup < Component

    # Create a button group
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::ButtonGroup.new(position: :vertical, size: :xs) do
    #     UiBibz::Ui.Button.new('test').render
    #     UiBibz::Ui.Button.new('test2').render
    #   end
    #
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
