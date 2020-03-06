# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundAddon < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize content, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      surround_addon_html_tag
    end

  private

    def surround_addon_html_tag
      content_tag :span, glyph_and_content_html, html_options
    end

    def component_html_classes
      'input-group-addon'
    end

  end
end
