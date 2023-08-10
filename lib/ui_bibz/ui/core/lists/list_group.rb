# frozen_string_literal: true

require 'ui_bibz/ui/core/lists/components/list'
module UiBibz::Ui::Core::Lists
  # Create a list group
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
  # * +flush+ - Boolean
  # * +tag_type+ - Type of list (default: :li)
  #   (+:a+, +:button+, +:li+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::ListGroup.new.tap |lg|
  #     ...
  #     lg.list content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ListGroup.new.tap do |d|
  #     d.list 'Test', status: :success
  #     d.list 'Test2', status: :primary
  #   end.render
  #
  #   UiBibz::Ui::Core::ListGroup.new(tag_type: :li).tap do |d|
  #     d.list 'Test', status: :success, url: '#test'
  #     d.list(status: :primary) do
  #       'Test 2'
  #     end
  #     d.list(state: :active) do |l|
  #       l.header 'My title', nil, class: 'my-title'
  #       l.body do
  #         'My content'
  #       end
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   list_group( options = {}, html_options = {}) do |l|
  #     l.list(content, options = {}, html_options = {})
  #     l.list(options = {}, html_options = {}) do
  #       content
  #     end
  #     l.list(options = {}, html_options = {}) do |li|
  #       li.header(content, options = {}, html_options = {})
  #       # or
  #       li.header(options = {}, html_options = {}) do
  #         content
  #       end
  #
  #       li.body(content, options = {}, html_options = {})
  #       # or
  #       li.body(options = {}, html_options = {}) do
  #         content
  #       end
  #     end
  #   end
  #
  class ListGroup < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(...)
      super
      @lists = []
    end

    # Render html tag
    def pre_render
      content_tag tag_type, @lists.join.html_safe, html_options
    end

    # Add group list
    # See UiBibz::Ui::Core::List
    def list(content = nil, options = {}, html_options = nil, &block)
      options = options.merge({ tag_type: @options[:tag_type] }) unless @options[:tag_type].nil?

      @lists << if tapped?(block)
                  content = (content || {}).merge(options)
                  UiBibz::Ui::Core::Lists::Components::List.new(content, options, html_options).tap(&block).render
                else
                  UiBibz::Ui::Core::Lists::Components::List.new(content, options, html_options, &block).render
                end
    end

    private

    def component_html_classes
      super << ['list-group', flush]
    end

    def flush
      'list-group-flush' if options[:flush]
    end

    def tag_type
      %i[a button].include?(options[:tag_type]) ? :div : :ul
    end
  end
end
