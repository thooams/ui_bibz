# frozen_string_literal: true

module GlyphExtension
  # Render glyph and content html
  def glyph_and_content_html(content_html = nil)
    if options[:glyph]
      UiBibz::ViewObjects::GlyphComponentViewObject.new(options, content_html || content).render
    else
      content_html || content
    end
  end
end
