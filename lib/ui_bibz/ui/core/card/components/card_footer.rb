module UiBibz::Ui::Core

  # Create a card footer
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
  #   UiBibz::Ui::Core::CardFooter.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::CardFooter.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::CardFooter.new.render
  #
  #   UiBibz::Ui::Core::CardFooter.new do
  #     'Exemple'
  #   end.render
  #
  class CardFooter < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, @content, class_and_html_options("card-footer")
    end

  end
end
