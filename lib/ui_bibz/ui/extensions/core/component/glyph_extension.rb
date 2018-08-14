module GlyphExtension

  # Render glyph and content html
  def glyph_and_content_html content_html = nil
    [glyph_with_space, ct_html(content_html)].compact.join(' ').html_safe
  end

  def ct_html content_html
    if options[:text].nil? || options[:text] == true
      content_html || content
    end
  end

  # Render glyph with space html
  def glyph_with_space
    out = [glyph]
    out << " " if options[:text] != false
    out.join unless glyph.nil?
  end

  # Render glyph html
  def glyph
    options[:content] = content if options[:text] == false
    options.delete(:status)
    UiBibz::Utils::GlyphChanger.new(options[:glyph], options).render
  end

end
