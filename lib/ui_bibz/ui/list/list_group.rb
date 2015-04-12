require "ui_bibz/ui/List/components/list"
module UiBibz::Ui
  class ListGroup < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @lists = []
    end

    def render
      content_tag type, @lists.join().html_safe, class_and_html_options("list-group")
    end

    def type
      @options[:type] == :link ? :div : :ul
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

  end
end
