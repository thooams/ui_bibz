module UiBibz::Ui::Core

  # Create a card column
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
  #   UiBibz::Ui::Core::CardColumn.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CardColumn.new(options = nil, html_options = nil) do |cg|
  #     cg.card content, options, html_options, &block
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::CardColumn.new do |cg|
  #     cg.card 'Exemple 1'
  #     cg.card 'Exemple 2'
  #     cg.card 'Exemple 3'
  #   end.render
  #
  class CardColumn < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag :div, @items.join.html_safe, class_and_html_options("card-columns")
    end

    def card content = nil, options = nil, html_options = nil, &block
      if is_tap content, options
        @items << UiBibz::Ui::Core::Card.new(content, options, html_options).tap(&block).render
      else
        @items << UiBibz::Ui::Core::Card.new(content, options, html_options, &block).render
      end
    end

  end
end
