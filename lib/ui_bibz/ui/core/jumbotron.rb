module UiBibz::Ui::Core

  # Create a jumbotron
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
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
  # * +full_with+ - Boolean to render jumbotron in fullscreen
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Jumbotron.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Jumbotron.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Jumbotron.new(content, full_width: true).render
  #
  #   UiBibz::Ui::Core::Jumbotron.new() do
  #     #content
  #   end.render
  #
  # ==== Helper
  #
  #   jumbotron(content, options = {} , html_options = {})
  #
  #   jumbotron(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Jumbotron < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, class_and_html_options(['jumbotron', fluid]) do
        if fluid
          Container.new(@content).render
        else
          @content
        end
      end
    end

  private

    def fluid
      "jumbotron-fluid" unless @options[:fluid].nil?
    end

  end
end
