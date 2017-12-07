module UiBibz::Ui::Ux::Containers::Components

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
  #   UiBibz::Ui::Core::Boxes::PanelBody.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::PanelBody.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::PanelBody.new.render
  #
  #   UiBibz::Ui::Core::Boxes::PanelBody.new do
  #     'Exemple'
  #   end.render
  #
  class PanelBody < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, glyph_and_content_html, html_options
    end

  private

    def component_html_classes
      super << ["panel-body"]
    end

  end
end
