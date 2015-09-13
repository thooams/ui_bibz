module UiBibz::Ui::Core

  # Create a card block
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
  #   UiBibz::Ui::Core::CardBlock.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CardBlock.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::CardBlock.new.render
  #
  #   UiBibz::Ui::Core::CardBlock.new do
  #     'Exemple'
  #   end.render
  #
  class CardBlock < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, @content, class_and_html_options("card-block")
    end

  end
end
