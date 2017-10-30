module UiBibz::Ui::Core::Cards::Components

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
  #   UiBibz::Ui::Core::Cards::CardImage.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Cards::CardImage.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Cards::CardImage.new.render
  #
  #   UiBibz::Ui::Core::Cards::CardImage.new do
  #     "/assets/images/test.png"
  #   end.render
  #
  class CardImage < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      #image_tag asset_path("assets/#{content}"), html_options
      image_tag content, html_options
    end

  private

    def component_html_classes
      position
    end

    def position
      "card-img-#{ @options[:position] || :top }"
    end

  end
end
