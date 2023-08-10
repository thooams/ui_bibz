# frozen_string_literal: true

module UiBibz::Ui::Core::Boxes::Components
  # Create a card list_group
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
  #   UiBibz::Ui::Core::Boxes::CardListGroup.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardListGroup.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardListGroup.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardListGroup.new do
  #     'Exemple'
  #   end.render
  #
  class CardListGroup < UiBibz::Ui::Core::Lists::ListGroup
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(...)
      super
      @lists = []
    end

    protected

    def component_html_classes
      %w[list-group-flush list-group]
    end
  end
end
