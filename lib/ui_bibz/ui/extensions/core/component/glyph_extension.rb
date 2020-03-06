# frozen_string_literal: true

module GlyphExtension
  # Render glyph and content html
  def glyph_and_content_html(content_html = nil)
    [glyph_with_space, ct_html(content_html)].compact.join(' ').html_safe
  end

  def ct_html(content_html)
    content_html || content if options[:text].nil? || options[:text] == true
  end

  # Render glyph with space html
  def glyph_with_space
    out = [glyph]
    out << ' ' if options[:text] != false
    out.join unless glyph.nil?
  end

  # Render glyph html
  def glyph
    options[:content] = content if options[:text] == false

    glyph_options = if options[:glyph].is_a?(Hash)
                      options[:glyph]
                    elsif options[:glyph].is_a?(String)
                      { name: options[:glyph] }
                    else
                      {}
                    end

    glyph_options[:text]       = options[:text] unless options[:text].nil?
    glyph_options[:content]    = options[:content] unless options[:content].nil?
    glyph_options[:shortcut]   = options[:shortcut] unless options[:shortcut].nil?
    glyph_options[:html_options] = options[:html_options]  unless options[:html_options].nil?

    UiBibz::Utils::GlyphChanger.new(glyph_options[:name], glyph_options).render unless glyph_options[:name].nil?
  end
end
