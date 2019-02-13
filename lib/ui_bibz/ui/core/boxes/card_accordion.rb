module UiBibz::Ui::Core::Boxes

  # Create a card accordion
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
  #   UiBibz::Ui::Core::Boxes::CardAccordion.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardAccordion.new(options = nil, html_options = nil) do |cg|
  #     cg.card content, options, html_options, &block
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardAccordion.new do |cg|
  #     cg.card 'Exemple 1'
  #     cg.card 'Exemple 2'
  #     cg.card 'Exemple 3'
  #   end.render
  #
  class CardAccordion < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def pre_render
      content_tag :div, @items.join.html_safe, html_options
    end

    def card content = nil, options = nil, html_options = nil, &block
      content = (content || {}).merge({ parent_collapse: id })
      @items << UiBibz::Ui::Core::Boxes::Card.new(content, options, html_options).tap(&block).render
    end

  private

    def id
      @id ||= generate_id("card-accordion-id")
    end

    def component_html_classes
      "accordion"
    end

    def component_html_options
      { id: id }
    end

  end
end
