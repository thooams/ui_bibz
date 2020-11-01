# frozen_string_literal: true

require 'ui_bibz/ui/ux/containers/components/panel_tab_group'
require 'ui_bibz/ui/ux/containers/components/panel_header_title'
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
  #   UiBibz::Ui::Core::Boxes::PanelHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CarHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::PanelHeader.new.render
  #
  #   UiBibz::Ui::Core::Boxes::PanelHeader.new do
  #     'Exemple'
  #   end.render
  #
  class PanelHeader < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat glyph_and_content_html
        concat @actions unless @actions.nil?
      end
    end

    def title(content = nil, options = nil, html_options = nil, &block)
      @content = PanelHeaderTitle.new(content, options, html_options, &block).render
    end

    def actions(content = nil, options = nil, html_options = nil, &block)
      @actions = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(content, options, html_options).tap(&block).render
    end

    def tab_group(content = nil, options = nil, html_options = nil, &block)
      @content = if tapped?(block)
                   PanelTabGroup.new(content, options, html_options).tap(&block).render
                 else
                   PanelTabGroup.new(content, options, html_options, &block).render
                 end
    end

    private

    def component_html_classes
      super << %w[panel-header justify-content-between]
    end
  end
end
