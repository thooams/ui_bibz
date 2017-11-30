module UiBibz::Ui::Ux::Containers::Components

  # Create a panel header
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
  #   UiBibz::Ui::Core::Boxes::CardHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CarHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardHeader.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardHeader.new do
  #     'Exemple'
  #   end.render
  #
  class PanelHeader < UiBibz::Ui::Core::Boxes::Components::CardHeader

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, html_options do
        concat glyph_and_content_html
        concat @actions unless @actions.nil?
      end
    end

    def title text
      @content = content_tag :div, text, class: 'panel-title'
    end

    def actions content = nil, options = nil, html_options = nil, &block
      @actions = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(content, options, html_options).tap(&block).render
    end

    private

    def component_html_classes
      super << ['panel-header', 'justify-content-between']
    end
  end
end
