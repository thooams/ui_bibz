require 'ui_bibz/ui/core/navs/components/pagination_link'
module UiBibz::Ui::Core::Navs

  # Create a Pagination
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
  # * +position+ - Symbol
  #   (+:left+, +:right+, +:center+)
  # * +size+
  #   (+:sm+, +:lg+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navs::Pagination.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navs::Pagination.new(options = nil, html_options = nil).tap do |n|
  #     ...
  #     n.link content = nil, options = nil, html_options = nil, block
  #     n.link content = nil, options = nil, html_options = nil, block
  #     n.dropdown content = nil, options = nil, html_options = nil, block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navs::Pagination.new(type: :pills).tap do |n|
  #     n.link 'Test', url: '#test'
  #     n.link 'Test2', url: '#test2', state: :active
  #     n.dropdown('Action') do |d|
  #       d.list content = nil, options = nil, html_options = nil, &block
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   ui_pagination(options = { tap: true }, html_options = {}) do |n|
  #     n.link(content, options = {}, html_options = {})
  #     n.link(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class Pagination < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag :nav do
        content_tag :ul, @items.join.html_safe, html_options
      end
    end

    # Add nav link items
    # See UiBibz::Ui::Core::Navs::NavLink
    def link content = nil, options = {}, html_options = nil, &block
      @items << PaginationLink.new(content, options, html_options, &block).render
    end

  private

    def component_html_classes
      ["pagination", position, size]
    end

    def position
      case @options[:position]
      when :center
        "justify-content-center"
      when :right
        "justify-content-end"
      else
        nil
      end
    end

    def size
      "pagination-#{ @options[:size] }" if @options[:size]
    end

  end
end
