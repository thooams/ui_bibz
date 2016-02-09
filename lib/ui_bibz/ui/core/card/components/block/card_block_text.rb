module UiBibz::Ui::Core

  # Create a card block title
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
  #   UiBibz::Ui::Core::CardBlockText.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CardBlockText.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::CardBlockText.new.render
  #
  #   UiBibz::Ui::Core::CardBlockText.new do
  #     'Exemple'
  #   end.render
  #
  class CardBlockText < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :p, content, html_options
    end

  private

    def component_html_classes
      "card-text"
    end

  end
end
