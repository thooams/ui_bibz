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
    if options.kind_of?(Hash)
      if options[:glyph].kind_of?(Hash)
        glyph_name = options[:glyph].try(:name)
        glyph_opts = options[:glyph]
      else
        glyph_name = options[:glyph]
        glyph_opts = {}
      end
      glyph_html_opts = options[:text].nil? ? {} : (options[:text] ? {} : { title: content })
    end


    UiBibz::Ui::Core::Icons::Glyph.new(glyph_name, glyph_opts, glyph_html_opts).render unless glyph_name.nil?
  end

end
