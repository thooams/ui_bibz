# frozen_string_literal: true

module UiBibz::Ui::Core::Boxes::Components

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
  #   UiBibz::Ui::Core::Boxes::CardFooter.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardFooter.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardFooter.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardFooter.new do
  #     'Exemple'
  #   end.render
  #
  class CardFooter < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      content_tag :div, glyph_and_content_html, html_options
    end

  private

    def muted
      "text-muted" unless @options[:muted].nil?
    end

    def component_html_classes
      ["card-footer", muted, outline]
    end

    def outline
      "text-#{ @options[:status] } border-#{ @options[:status] } bg-transparent" if @options[:outline]
    end

  end
end
