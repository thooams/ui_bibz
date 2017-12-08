require 'ui_bibz/ui/core/forms/buttons/components/button_group_dropdown'
module UiBibz::Ui::Core::Forms::Buttons

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
  # * +status+ - status of element with +symbol+ value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+ - Size of element with +symbol+ value:
  #   (+:xs+, +:sm+, +:lg+)
  # * +position+ - Position vertical or horizontal with +symbol+ value:
  #   (+:vertical+, +:horizontal+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(options = nil, html_options = nil) do |bg|
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(position: :vertical, size: :xs) do |bg|
  #     bg.ui_button 'test'
  #     bg.ui_button 'test2'
  #   end.render
  #
  # ==== Helper
  #
  #   ui_button_group(options = {}, html_options = {}) do |bg|
  #     bg.ui_button 'content'
  #     bg.ui_button_link 'Link', url: '#'
  #   end
  #
  class ButtonGroup < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag :div, @items.join.html_safe, html_options
    end

    def button content = nil, options = nil, html_options = nil, &block
      if block.nil?
        options = @options.merge(options || {})
      else
        content = @options.merge(content || {})
      end

      @items << Button.new(content, options, html_options, &block).render
    end

    def button_link content = nil, options = nil, html_options = nil, &block
      if block.nil?
        options = @options.merge(options || {})
      else
        content = @options.merge(content || {})
      end

      @items << ButtonLink.new(content, options, html_options, &block).render
    end

    def dropdown content, options = {}, html_options = nil, &block
      options = @options.merge(options)
      @items << ButtonGroupDropdown.new(content, options, html_options).tap(&block).render
    end

    def input attribute_name, options = {}, &block
      options = @options.merge(options)

      @items << @options[:form].input(attribute_name, options.merge({ label: false, wrapper: false }), &block)
    end

    def html content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::Component.new(content, options, html_options, &block).render
    end

  private

    def component_html_classes
      super << [class_name, size, position]
    end

    def component_html_options
      { role: type }
    end

    def type
      options[:type] || :group
    end

    def component_html_data
      super
    end

    def class_name
      "btn-group" if options[:position] != :vertical
    end

    def size
      "btn-group-#{ options[:size] }" if options[:size]
    end

    def position
      "btn-group-#{ options[:position] }" if options[:position]
    end

  end
end
