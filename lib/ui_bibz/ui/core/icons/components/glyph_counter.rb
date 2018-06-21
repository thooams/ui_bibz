module UiBibz::Ui::Core::Icons::Components

  class GlyphCounter < UiBibz::Ui::Core::Icons::Components::GlyphText

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content, options = nil, html_options = nil, &block
      super
    end

    private

    def component_html_classes
      ["fa-layers-counter", position]
    end

    def position
      "fa-layers-#{ options[:position] }" if options[:position]
    end

  end
end
