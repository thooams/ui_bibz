# frozen_string_literal: true

module UiBibz::Ui::Core::Boxes::Components
  # Create a card col
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
  #   UiBibz::Ui::Core::Boxes::CardCol.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardCol.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  #   UiBibz::Ui::Core::Boxes::CardCol.new(options = nil, html_options = nil) do |col|
  #     col.body do
  #       content
  #     end
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardCol.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardCol.new do
  #     'Exemple'
  #   end.render
  #
  #   UiBibz::Ui::Core::Boxes::CardCol.new do |col|
  #     col.body do
  #      'Exemple'
  #     end
  #   end.render
  #
  class CardCol < UiBibz::Ui::Core::Layouts::Col
    include UiBibz::Ui::Concerns::CardItemableConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
      @items = [@content]
    end

    def pre_render
      content_tag :div, html_structure, html_options
    end

    private

    def html_structure
      [@header, @items.join, @footer].compact.join.html_safe
    end
  end
end
