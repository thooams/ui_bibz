module UiBibz::Helpers::Ui::Core::CardsHelper

  # Card Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Option +tap: true+ is required if you want add +header+, +block+ or
  # +footer+.
  def ui_card content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Core::Cards::Card.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Cards::Card.new(content, options, html_options, &block).render
    end
  end

  # Card Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_card_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Cards::CardGroup.new(content, options, html_options).tap(&block).render
  end

  # Card Deck Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_card_deck content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Cards::CardDeck.new(content, options, html_options).tap(&block).render
  end

  # Card Column Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_card_column content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Cards::CardColumn.new(content, options, html_options).tap(&block).render
  end

end
