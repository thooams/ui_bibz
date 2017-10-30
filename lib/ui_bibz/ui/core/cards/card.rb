require 'ui_bibz/ui/core/cards/components/card_header'
require 'ui_bibz/ui/core/cards/components/card_footer'
require 'ui_bibz/ui/core/cards/components/card_body'
require 'ui_bibz/ui/core/cards/components/card_image'
require 'ui_bibz/ui/core/cards/components/card_list_group'
module UiBibz::Ui::Core::Cards

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
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * text - Hash (+:size+, +:position+)
  #   (+:left+, +:right+, +:center+)
  # * block - Boolean
  # * type - Symbol
  #   (+:inverse+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Cards::Card.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Cards::Card.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  #   UiBibz::Ui::Core::Cards::Card.new(options = nil, html_options = nil).tap do |p|
  #     p.header content = nil, options = nil, html_options = nil, &block
  #     p.block content = nil, options = nil, html_options = nil, &block
  #     p.footer content = nil, options = nil, html_options = nil, &block
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Cards::Card('test').render
  #
  #   UiBibz::Ui::Core::Cards::Card(status: :primary) do |d|
  #     'test'
  #   end.render
  #
  #   UiBibz::Ui::Core::Cards::Card.new().tap do |p|
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
  #     p.body(content, options = {}, html_options = {})
  #     # or
  #     p.body(options = {}, html_options = {}) do
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
  class Card < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = @content.nil? ? [] : [UiBibz::Ui::Core::Cards::Components::CardBody.new(@content).render]
    end

    # Add Header which is a component
    def header content = nil, options = nil, html_options = nil, &block
      options, content = inherit_options(content, options, block)
      @header = UiBibz::Ui::Core::Cards::Components::CardHeader.new(content, options, html_options, &block).render
    end

    # Add Body div which is a component
    def body content = nil, options = nil, html_options = nil, &block
      options, content = inherit_options(content, options, block)
      if is_tap(content, options)
        @items << UiBibz::Ui::Core::Cards::Components::CardBody.new(content, options, html_options).tap(&block).render
      else
        @items << UiBibz::Ui::Core::Cards::Components::CardBody.new(content, options, html_options, &block).render
      end
    end

    # Add Footer which is a component
    def footer content = nil, options = nil, html_options = nil, &block
      options, content = inherit_options(content, options, block)
      @footer = UiBibz::Ui::Core::Cards::Components::CardFooter.new(content, options, html_options, &block).render
    end

    # Add List group which is a component
    def list_group content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::Cards::Components::CardListGroup.new(content, options, html_options).tap(&block).render
    end

    # Add Image which is a component
    def image content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::Cards::Components::CardImage.new(content, options, html_options, &block).render
    end

    # Render html tag
    def render
      content_tag :div, html_structure, html_options
    end

  protected

    def html_structure
      [@header, @items.join, @footer].compact.join.html_safe
    end

    def inherit_options content, options, block
      if block.nil?
        options = (options || {}).merge({ outline: @options[:outline] , status: @options[:status] })
      else
        content = (content || {}).merge({ outline: @options[:outline], status: @options[:status] })
      end
      [options, content]
    end

    def component_html_classes
      ["card", text, type, tab_pane, outline]
    end

    def status
      unless @options[:status].nil?
        output = @options[:outline] ? ["border-#{ @options[:status] }"] : ["bg-#{ @options[:status] }"]
        output << "text-white" if @options[:status] != :light && @options[:status] != :warning
        output.join(' ')
      end
    end

    def text
      "text-#{ @options[:text][:size] || :md }-#{ @options[:text][:position] || :left }" unless @options[:text].nil?
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

    def outline
      "bg-transparent" if @options[:outline]
    end

  end
end
