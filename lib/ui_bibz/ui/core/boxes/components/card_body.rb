require 'ui_bibz/ui/core/boxes/components/body/card_body_text'
require 'ui_bibz/ui/core/boxes/components/body/card_body_title'
require 'ui_bibz/ui/core/boxes/components/body/card_body_link'
module UiBibz::Ui::Core::Boxes::Components

  # Create a card body
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
  #   UiBibz::Ui::Core::Boxes::CardBody.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CardBody.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardBody.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardBody.new do
  #     'Exemple'
  #   end.render
  #
  class CardBody < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = [@content]
    end

    # Render html tag
    def pre_render
      content_tag :div, @items.join.html_safe, html_options
    end

    def title content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::Boxes::Components::Body::CardBodyTitle.new(content, options, html_options, &block).render
    end

    def link content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::Boxes::Components::Body::CardBodyLink.new(content, options, html_options, &block).render
    end

    def text content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::Boxes::Components::Body::CardBodyText.new(content, options, html_options, &block).render
    end

  private

    def component_html_classes
      ["card-body", outline]
    end

    def outline
      "text-#{ @options[:status] }" if @options[:outline]
    end

  end
end
