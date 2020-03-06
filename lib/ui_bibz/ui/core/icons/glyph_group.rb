# frozen_string_literal: true

require "ui_bibz/ui/core/icons/components/glyph_text"
require "ui_bibz/ui/core/icons/components/glyph_counter"
module UiBibz::Ui::Core::Icons

  # Create a glyph group
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
  # * +name+ - String
  # * +size+ - Integer
  # * +type+ - Symbol
  # * +text+ - String
  # * +status+ - Symbol
  #   (+:secondary+, +:primary+, +:info+, +:warning+, +:danger+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Icons::GlyphGroup.new content = nil, options = nil, html_options = nil,
  #   &block
  #
  #   UiBibz::Ui::Core::Icons::GlyphGroup.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  #   UiBibz::Ui::Core::Icons::GlyphGroup.new content = {}
  #
  #   UiBibz::Ui::Core::Icons::GlyphGroup.new content, options = {}, html_options = {}
  #
  # ==== Exemples
  #
  #   UiBibz::Ui::Core::Icons::GlyphGroup.new('eye').render
  #
  #   UiBibz::Ui::Core::Icons::GlyphGroup.new() do
  #     name
  #   end.render
  #
  #   UiBibz::Ui::Core::Icons::GlyphGroup.new('eye', { size: 3, type: 'fw' }).render
  #
  #   UiBibz::Ui::Core::Icons::GlyphGroup.new({ name: 'eye', size: 3, type: 'fw' }).render
  #
  # ==== Helper
  #
  #   glyph(options = {})
  #
  #   glyph(name, options = {}, html_options = {})
  #
  #   glyph(options = {}, html_options = {}) do
  #     name
  #   end
  class GlyphGroup < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def pre_render
      content_tag :span, @items.join().html_safe, html_options
    end

    def glyph content = nil, options = {} , html_options = nil, &block
      @items << UiBibz::Ui::Core::Icons::Glyph.new(content, options, html_options, &block).render
    end

    def text content = nil, options = {} , html_options = nil, &block
      @items << UiBibz::Ui::Core::Icons::Components::GlyphText.new(content, options, html_options, &block).render
    end

    def counter content = nil, options = {} , html_options = nil, &block
      @items << UiBibz::Ui::Core::Icons::Components::GlyphCounter.new(content, options, html_options, &block).render
    end

    private

    def component_html_classes
      super << ["fa-layers", "fa-fw", size]
    end

    def size
      if options[:size]
        if options[:size].kind_of?(Integer)
          "fa-#{ options[:size] }x"
        else
          "fa-#{ options[:size] }"
        end
      end
    end

  end
end
