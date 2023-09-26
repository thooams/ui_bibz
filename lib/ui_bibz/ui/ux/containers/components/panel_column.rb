# frozen_string_literal: true

module UiBibz::Ui::Ux::Containers::Components
  # Create a panel column
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
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::PanelColumn.new do |cg|
  #     cg.panel 'Exemple 1'
  #     cg.panel 'Exemple 2'
  #     cg.panel 'Exemple 3'
  #   end.render
  #
  class PanelColumn < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(...)
      super
      @items = []
    end

    # Render html tag
    def pre_render
      content_tag :div, @items.join.html_safe, html_options
    end

    def panel(content = nil, options = nil, html_options = nil, &)
      @items << UiBibz::Ui::Ux::Containers::Panel.new(content, options, html_options).tap(&).render
    end

    private

    def component_html_classes
      'panel-columns'
    end
  end
end
