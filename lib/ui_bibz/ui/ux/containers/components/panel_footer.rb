# frozen_string_literal: true

require 'ui_bibz/ui/core/boxes/components/card_footer'
module UiBibz::Ui::Ux::Containers::Components
  # Create a panel footer
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
  #   UiBibz::Ui::Core::Boxes::PanelFooter.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::PanelFooter.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::PanelFooter.new.render
  #
  #   UiBibz::Ui::Core::Boxes::PanelFooter.new do
  #     'Exemple'
  #   end.render
  #
  class PanelFooter < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, glyph_and_content_html, html_options
    end

    private

    def component_html_classes
      super << ['panel-footer']
    end
  end
end
