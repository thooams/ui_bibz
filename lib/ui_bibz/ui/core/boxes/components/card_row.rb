# frozen_string_literal: true

require 'ui_bibz/ui/core/boxes/components/card_col'
module UiBibz::Ui::Core::Boxes::Components
  # Create a card row
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
  #   UiBibz::Ui::Core::Boxes::CardRow.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardRow.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  #   UiBibz::Ui::Core::Boxes::CardRow.new(options = nil, html_options = nil) do |row|
  #     row.col do
  #       content
  #     end
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardRow.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardRow.new do
  #     'Exemple'
  #   end.render
  #
  #   UiBibz::Ui::Core::Boxes::CardRow.new(tap: true) do |row|
  #     row.col do
  #      'Exemple'
  #     end
  #   end.render
  #
  class CardRow < UiBibz::Ui::Core::Layouts::Row
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
      @items = [@content]
    end

    def pre_render
      content_tag :div, @items.join.html_safe, html_options
    end

    def col(content = nil, options = nil, html_options = nil, &block)
      @items << if tap?(content, options)
                  UiBibz::Ui::Core::Boxes::Components::CardCol.new(content, options, html_options).tap(&block).render
                else
                  UiBibz::Ui::Core::Layouts::Col.new(content, options, html_options, &block).render
                end
    end
  end
end
