module GlyphExtension

  # Render glyph and content html
  def glyph_and_content_html content_html = nil
    [glyph_with_space, content_html || content].compact.join.html_safe
  end

  # Render glyph with space html
  def glyph_with_space
    "#{ glyph } " unless glyph.nil?
  end

  # Render glyph html
  def glyph
    glyph_info = options[:glyph] if options.kind_of?(Hash)
    UiBibz::Ui::Core::Glyph.new(glyph_info).render unless glyph_info.nil?
  end

end
