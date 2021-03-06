# frozen_string_literal: true

module UiBibz::Ui::Core::Boxes::Components
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
  #   UiBibz::Ui::Core::Boxes::CardImage.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardImage.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardImage.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardImage.new do
  #     "/assets/images/test.png"
  #   end.render
  #
  class CardImage < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      # image_tag content, html_options
      if options[:pack]
        image_pack_tag content, html_options
      else
        image_tag content, html_options
      end
    end

    private

    def component_html_classes
      position
    end

    def position
      "card-img-#{@options[:position] || :top}" if @options[:position]
    end
  end
end
