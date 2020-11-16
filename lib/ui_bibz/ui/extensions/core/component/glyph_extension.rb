# frozen_string_literal: true

module GlyphExtension
  # Render glyph and content html
  def glyph_and_content_html(content_html = nil)
    options[:glyph] ? generate_glyph(content_html) : content_html || content
  end

  # Render glyph html
  def generate_glyph(content_html)
    glyph_options = if options[:glyph].is_a?(Hash)
                      options[:glyph]
                    elsif options[:glyph]
                      { name: options[:glyph] }
                    else
                      {}
                    end

    glyph_options = glyph_options.tap do |h|
      h[:text] = options[:text]
      h[:label] = options[:label] || content_html || content
      h[:shortcut] = options[:shortcut] unless options[:shortcut].nil?
    end

    # UiBibz::Utils::GlyphChanger.new(glyph_options[:name], glyph_options).render unless glyph_options[:name].nil?
    UiBibz::Ui::Core::Icons::Glyph.new(glyph_options[:name], glyph_options).render if glyph_options[:name].present?
  end
end
