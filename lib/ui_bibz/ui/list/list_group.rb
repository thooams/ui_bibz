require "ui_bibz/ui/list/components/list"
module UiBibz::Ui
  class ListGroup < Component

    # Create a list group
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
    # * +type+ - Type of list
    #   (+:link+, +:list+)
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::ListGroup.new().tap |lg|
    #     ...
    #     lg.list content = nil, options = nil, html_options = nil, &block
    #     ...
    #   end
    #
    # ==== Examples
    #
    #   UiBibz::Ui::ListGroup.new().tap do |d|
    #     d.list 'Test', state: :success
    #     d.list 'Test2', state: :primary
    #   end.render
    #
    #   UiBibz::Ui::ListGroup.new(type: :link).tap do |d|
    #     d.list 'Test', state: :success, url: '#test'
    #     d.list(state: :primary) do
    #       'Test 2'
    #     end
    #     d.list(tap: true, status: :active) do |l|
    #       l.header 'My title', nil, class: 'my-title'
    #       l.body do
    #         'My content'
    #       end
    #     end
    #   end.render
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @lists = []
    end

    def render
      content_tag type, @lists.join().html_safe, class_and_html_options("list-group")
    end

    def list content = nil, options = {} , html_options = nil, &block
      is_tap  = (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
      options = options.merge({ type: :link }) if @options[:type] == :link

      if is_tap
        @lists << List.new(content, options, html_options).tap(&block).render
      else
        @lists << List.new(content, options, html_options, &block).render
      end
    end

  private

    def type
      @options[:type] == :link ? :div : :ul
    end

  end
end
