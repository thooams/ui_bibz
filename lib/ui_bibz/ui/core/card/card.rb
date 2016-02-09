require 'ui_bibz/ui/core/card/components/card_header'
require 'ui_bibz/ui/core/card/components/card_footer'
require 'ui_bibz/ui/core/card/components/card_block'
require 'ui_bibz/ui/core/card/components/card_image'
require 'ui_bibz/ui/core/card/components/card_list_group'
module UiBibz::Ui::Core

  # Create a card
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # You can use tap method to add header, body or footer element.
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
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * text_position - Symbole
  #   (+:left+, +:right+, +:center+)
  # * block - Boolean
  # * type - Symbol
  #   (+:inverse+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Card.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Card.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  #   UiBibz::Ui::Core::Card.new(options = nil, html_options = nil).tap do |p|
  #     p.header content = nil, options = nil, html_options = nil, &block
  #     p.block content = nil, options = nil, html_options = nil, &block
  #     p.footer content = nil, options = nil, html_options = nil, &block
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Card('test').render
  #
  #   UiBibz::Ui::Core::Card(state: :primary) do |d|
  #     'test'
  #   end.render
  #
  #   UiBibz::Ui::Core::Card.new().tap do |p|
  #     p.header 'header', glyph: 'eye', class: 'header-test'
  #     p.block do
  #       'body'
  #     end
  #     p.footer 'footer'
  #   end.render
  #
  # ==== Helper
  #
  #   card(content, options = {}, html_options = {})
  #
  #   card(options = {}, html_options = {}) do
  #     content
  #   end
  #
  #   card(options = { tap: true }, html_options = {}) do |p|
  #     p.header(content, options = {}, html_options = {})
  #     # or
  #     p.header(options = {}, html_options = {}) do
  #       content
  #     end
  #
  #     p.block(content, options = {}, html_options = {})
  #     # or
  #     p.block(options = {}, html_options = {}) do
  #       content
  #     end
  #
  #     p.footer(content, options = {}, html_options = {})
  #     # or
  #     p.footer(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class Card < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = [@content]
    end

    # Add Header which is a component
    def header content = nil, options = nil, html_options = nil, &block
      @items << CardHeader.new(content, options, html_options, &block).render
    end

    # Add Block div which is a component
    def block content = nil, options = nil, html_options = nil, &block
      if is_tap(content, options)
        @items << CardBlock.new(content, options, html_options).tap(&block).render
      else
        @items << CardBlock.new(content, options, html_options, &block).render
      end
    end

    # Add Footer which is a component
    def footer content = nil, options = nil, html_options = nil, &block
      @items << CardFooter.new(content, options, html_options, &block).render
    end

    # Add List group which is a component
    def list_group content = nil, options = nil, html_options = nil, &block
      @items << CardListGroup.new(content, options, html_options).tap(&block).render
    end

    # Add Image which is a component
    def image content = nil, options = nil, html_options = nil, &block
      @items << CardImage.new(content, options, html_options, &block).render
    end

    # Render html tag
    def render
      content_tag :div, @items.join.html_safe, html_options
    end

  protected

    def component_html_classes
      ["card", text_position, card_block, type, tab_pane]
    end

    def state
      "card-#{ states[@options[:state]] }" unless @options[:state].nil?
    end

    def text_position
      "text-#{ @options[:text_position] }" unless @options[:text_position].nil?
    end

    def card_block
      "card-block" if !@options[:block].nil? || @options[:tap].nil?
    end

    def type
      "card-#{ @options[:type] }" unless @options[:type].nil?
    end

    def tab_pane
      "tab-pane" if @options[:tab]
    end

  end
end
