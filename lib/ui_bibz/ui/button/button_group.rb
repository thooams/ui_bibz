module UiBibz::Ui

  # Create a button group
  #
  # This element is an extend of UiBibz::Ui::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +state+ - State of element with +symbol+ value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +size+ - Size of element with +symbol+ value:
  #   (+:xs+, +:sm+, +:lg+)
  # * +position+ - Position vertical or horizontal with +symbol+ value:
  #   (+:vertical+, +:horizontal+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::ButtonGroup.new(options = nil, html_options = nil) do
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::ButtonGroup.new(position: :vertical, size: :xs) do
  #     UiBibz::Ui.Button.new('test').render
  #     UiBibz::Ui.Button.new('test2').render
  #   end.render
  #
  class ButtonGroup < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, @content, class_and_html_options(["btn-#{ type }", size, position]).merge({ role: type })
    end

  private

    def type
      @options[:type] || :group
    end

    def size
      "btn-group-#{ @options[:size] }" if @options[:size]
    end

    def position
      "btn-group-#{ @options[:position] }" if @options[:position]
    end

  end
end
