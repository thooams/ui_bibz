# frozen_string_literal: true

module UiBibz::Helpers::Ui::Core::BoxesHelper
  # Card Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Option +tap: true+ is required if you want add +header+, +block+ or
  # +footer+.
  def ui_card(content = nil, options = nil, html_options = nil, &block)
    if tapped?(block)
      UiBibz::Ui::Core::Boxes::Card.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Boxes::Card.new(content, options, html_options, &block).render
    end
  end

  # Card Accordion
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_card_accordion(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Boxes::CardAccordion.new(content, options, html_options).tap(&block).render
  end

  # Card Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_card_group(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Boxes::CardGroup.new(content, options, html_options).tap(&block).render
  end

  # Card Deck Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_card_deck(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Boxes::CardDeck.new(content, options, html_options).tap(&block).render
  end

  # Card Grid Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_card_grid(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Boxes::CardGrid.new(content, options, html_options).tap(&block).render
  end

  # Card Column Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_card_column(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Boxes::CardColumn.new(content, options, html_options).tap(&block).render
  end

  # Jumbotron Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_jumbotron(content = nil, options = nil, html_options = nil, &block)
    UiBibz::Ui::Core::Boxes::Jumbotron.new(content, options, html_options, &block).render
  end
end
