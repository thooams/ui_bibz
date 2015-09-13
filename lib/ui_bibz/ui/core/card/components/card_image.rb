module UiBibz::Ui::Core

  # Create a card image
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
  # * +position+ - Symbol
  #   (+top+, +bottom+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::CardImage.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CardImage.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::CardImage.new.render
  #
  #   UiBibz::Ui::Core::CardImage.new do
  #     'Exemple'
  #   end.render
  #
  class CardImage < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      image_tag @content, class_and_html_options(position)
    end

    private

    def position
      "card-img-#{ @options[:position] }" unless @options[:position].nil?
    end

  end
end
