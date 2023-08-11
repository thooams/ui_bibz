# frozen_string_literal: true

module UiBibz
  module ViewObjects
    class GlyphComponentViewObject
      attr_accessor :options, :content

      def initialize(options, content = nil)
        @options = options
        @content = content
      end

      def render
        UiBibz::Ui::Core::Icons::Glyph.new(glyph_options[:name], mute_glyph_option).render if glyph_options[:name].present?
      end

      private

      def glyph_options
        if options[:glyph].is_a?(Hash)
          options[:glyph]
        elsif options[:glyph]
          { name: options[:glyph] }
        else
          {}
        end
      end

      def mute_glyph_option
        glyph_options.tap do |h|
          h[:text] = options[:text]
          h[:label] = options[:label] || content
          h[:shortcut] = options[:shortcut] unless options[:shortcut].nil?
        end
      end
    end
  end
end
