# frozen_string_literal: true

module UiBibz::Ui::Core::Icons::Components
  class GlyphText < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      content_tag :span, content, html_options
    end

    private

    def component_html_data
      super
      transform
    end

    def component_html_classes
      super << %w[fa-layers-text fa-inverse]
    end

    def transform
      add_html_data 'fa_transform', options[:transform] if options[:transform]
    end
  end
end
