module UiBibz::Ui::Core

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
  #   UiBibz::Ui::Core::CardListGroup.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CardListGroup.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::CardListGroup.new.render
  #
  #   UiBibz::Ui::Core::CardListGroup.new do
  #     'Exemple'
  #   end.render
  #
  class CardListGroup < UiBibz::Ui::Core::ListGroup

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @lists = []
    end

    protected

    def component_html_classes
      "list-group-flush"
    end

  end
end
