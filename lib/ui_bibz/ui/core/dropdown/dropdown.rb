require 'ui_bibz/ui/core/dropdown/components/dropdown_list'
require 'ui_bibz/ui/core/dropdown/components/dropdown_link'
module UiBibz::Ui::Core

  # Create a dropdown
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # You can use tap method to add list items.
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
  # * +state+ - State of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Dropdown.new(options = nil, html_options = nil).tap do |d|
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Dropdown.new(name, state: :success).tap do |d|
  #     d.link 'test', '#'
  #     d.list('---')
  #     d.list('Header 1', { type: :header })
  #     d.list 'test2', '#'
  #   end.render
  #
  # ==== Helper
  #
  #   dropdown(name, options = { tap: true }, html_options = {}) do |d|
  #     d.list(content, options = {}, html_options = {})
  #     d.list(options = {}, html_options = {}) do
  #       content
  #     end
  #     d.link(content, options = {}, html_options = {})
  #     d.link(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class Dropdown < Component

    def initialize content, options = nil, html_options  = nil, &block
      super
      @items = []
      @state = @options.delete(:state)
    end

    # Render html tag
    def render
      content_tag :div, class_and_html_options(type) do
        concat button_html
        concat ul_html
      end
    end

    # Add dropdown list
    # See UiBibz::Ui::Core::DropdownList
    def list content = nil, options = nil, html_options = nil, &block
      @items << DropdownList.new(content, options, html_options, &block).render
    end

    # Add dropdown link in list
    # See UiBibz::Ui::Core::DropdownLink
    def link content = nil, options = nil, html_options = nil, &block
      @items << DropdownLink.new(content, options, html_options, &block).render
    end

  protected

    def button_content
      [glyph_with_space, @content, ' ', caret].compact.join.html_safe
    end

    def button_html
      content_tag :button, button_content, class: add_classes("btn", button_state, size, "dropdown-toggle"), type: 'button', "data-toggle" => 'dropdown', "aria-expanded" => false
    end

    def ul_html
      content_tag :ul, @items.join.html_safe, class: "dropdown-menu dropdown-menu-#{ position }", role: 'menu'
    end

    def caret
      content_tag :span, '', class: 'caret'
    end

    def position
      @options[:position] || 'left'
    end

    def type
      @options[:type] || 'dropdown'
    end

    def button_state
      sym = @state || :default
      "btn-#{  states[sym] }"
    end

    # :lg, :sm or :xs
    def size
      "btn-#{ @options[:size] }" if @options[:size]
    end

  end
end
