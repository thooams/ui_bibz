require 'ui_bibz/ui/core/card/components/block/card_block_text'
require 'ui_bibz/ui/core/card/components/block/card_block_title'
require 'ui_bibz/ui/core/card/components/block/card_block_link'
module UiBibz::Ui::Core

  # Create a card block
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::CardBlock.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CardBlock.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::CardBlock.new.render
  #
  #   UiBibz::Ui::Core::CardBlock.new do
  #     'Exemple'
  #   end.render
  #
  class CardBlock < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = [@content]
    end

    # Render html tag
    def render
      content_tag :div, @items.join.html_safe, html_options
    end

    def title content = nil, options = nil, html_options = nil, &block
      @items << CardBlockTitle.new(content, options, html_options, &block).render
    end

    def link content = nil, options = nil, html_options = nil, &block
      @items << CardBlockLink.new(content, options, html_options, &block).render
    end

    def text content = nil, options = nil, html_options = nil, &block
      @items << CardBlockText.new(content, options, html_options, &block).render
    end

  private

    def component_html_classes
      "card-block"
    end

  end
end
