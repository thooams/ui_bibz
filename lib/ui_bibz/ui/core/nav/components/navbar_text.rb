module UiBibz::Ui::Core

  # Create a NavbarText
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
  #   (+:right+, +:left+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::NavbarText.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::NavbarText.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::NavbarText.new('Exemple).render
  #
  #   UiBibz::Ui::Core::NavbarText.new(position: :right) do
  #     'Exemple'
  #   end.render
  #
  class NavbarText < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :ul, @content, class_and_html_options(["navbar-text", position])
    end

  end
end
