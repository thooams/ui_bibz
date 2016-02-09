module UiBibz::Ui::Core

  # Create a button group
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
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
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+ - Size of element with +symbol+ value:
  #   (+:xs+, +:sm+, +:lg+)
  # * +position+ - Position vertical or horizontal with +symbol+ value:
  #   (+:vertical+, +:horizontal+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::ButtonGroup.new(options = nil, html_options = nil) do
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ButtonGroup.new(position: :vertical, size: :xs) do
  #     UiBibz::Ui::Core.Button.new('test').render
  #     UiBibz::Ui::Core.Button.new('test2').render
  #   end.render
  #
  # ==== Helper
  #
  #   button_group(content, options = {}, html_options = {})
  #
  #   button_group(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class ButtonGroup < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, content, html_options
    end

  private

    def component_html_classes
      ["btn-#{ type }", size, position]
    end

    def component_html_options
      { role: type, data: { toggle: 'buttons' } }
    end

    def component_html_data
      add_html_data "toggle", "buttons"
    end

    def type
      options[:type] || :group
    end

    def size
      "btn-group-#{ options[:size] }" if options[:size]
    end

    def position
      "btn-group-#{ options[:position] }" if options[:position]
    end

  end
end
