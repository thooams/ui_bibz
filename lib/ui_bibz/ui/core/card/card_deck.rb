module UiBibz::Ui::Core

  # Create a card deck
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
  #   UiBibz::Ui::Core::CardDeck.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CardDeck.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::CardDeck.new do |cg|
  #     cg.card 'Exemple'
  #   end.render
  #
  class CardDeck < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag :div, class_and_html_options("card-deck-wrapper") do
        content_tag :div, @items.join.html_safe, class: 'card-deck'
      end
    end

    def card content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::Card.new(content, options, html_options, &block).render
    end

  end
end
