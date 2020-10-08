# frozen_string_literal: true

module UiBibz::Ui::Core::Boxes
  # Create a card group
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
  #   UiBibz::Ui::Core::Boxes::CardGroup.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardGroup.new(options = nil, html_options = nil) do
  #     cg.card content, options, html_options, &block
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardGroup.new do |cg|
  #     cg.card 'Exemple 1'
  #     cg.card 'Exemple 2'
  #     cg.card 'Exemple 3'
  #   end.render
  #
  class CardGroup < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
      @items = []
    end

    # Render html tag
    def pre_render
      content_tag :div, @items.join.html_safe, html_options
    end

    def card(content = nil, options = nil, html_options = nil, &block)
      @items << if tapped?(block)
                  UiBibz::Ui::Core::Boxes::Card.new(content, options, html_options).tap(&block).render
                else
                  UiBibz::Ui::Core::Boxes::Card.new(content, options, html_options, &block).render
                end
    end

    private

    def component_html_classes
      'card-group'
    end
  end
end
