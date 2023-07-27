# frozen_string_literal: true

require 'ui_bibz/ui/core/forms/buttons/components/button_group_dropdown'
require 'ui_bibz/ui/core/forms/buttons/components/button_group_split_dropdown'
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
  # * +state+
  #   (+:active+, +:disabled+)
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
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &)
      super
      @items = []
    end

    # Render html tag
    def pre_render
      content_tag :div, @items.map { |item| item.respond_to?(:render) ? item.try(:render) : item }.join.html_safe, html_options
    end

    def button(content = nil, options = nil, html_options = nil, &block)
      if block.nil?
        options = @options.merge(options || {})
      else
        content = @options.merge(content || {})
      end

      @items << Button.new(content, options, html_options, &block)
    end

    def button_link(content = nil, options = nil, html_options = nil, &block)
      if block.nil?
        options = @options.merge(options || {})
      else
        content = @options.merge(content || {})
      end

      @items << ButtonLink.new(content, options, html_options, &block)
    end

    def dropdown(content, options = {}, html_options = nil, &)
      options = @options.merge(options)
      @items << ButtonGroupDropdown.new(content, options, html_options).tap(&)
    end

    def split_dropdown(content, options = {}, html_options = nil, &)
      options = @options.merge(options)
      @items << ButtonGroupSplitDropdown.new(content, options, html_options).tap(&)
    end

    def input(attribute_name, options = {}, &)
      options = @options.merge(options)

      @items << @options[:form].input(attribute_name, options.merge({ label: false, wrapper: false }), &)
    end

    def html(content = nil, options = nil, html_options = nil, &)
      @items << UiBibz::Ui::Core::Component.new(content, options, html_options, &)
    end

    def choice_group(content = nil, options = nil, html_options = nil, &)
      @items << UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new(content, options, html_options).tap(&)
    end

    private

    def component_html_classes
      super
      html_class_builder.add position
    end

    def component_html_options
      { role: options[:type] || :group }
    end

    ### HTML classes ###########################################################

    def initial_html_classes
      'btn-group' if options[:position] != :vertical
    end

    def size
      "btn-group-#{options[:size]}" if options[:size]
    end

    def position
      "btn-group-#{options[:position]}" if options[:position]
    end
  end
end
