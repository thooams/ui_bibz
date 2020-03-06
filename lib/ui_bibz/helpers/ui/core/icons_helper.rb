# frozen_string_literal: true

module UiBibz::Helpers::Ui::Core::IconsHelper

  # Glyph Component
  #
  # + content+ (String || Hash) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Glyph component with some exeption, it can be written
  # => glyph 'calendar', size: :xs
  # or
  # => glyph { name: 'calendar', size: :xs }
  def ui_glyph content, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Icons::Glyph.new(content, options, html_options, &block).render
  end

  # Glyph Group Component
  #
  # + content+ (String || Hash) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def ui_glyph_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Icons::GlyphGroup.new(content, options, html_options).tap(&block).render
  end

  # Glyph Changer
  #
  # +options+ (Hash)
  #
  def ui_glyph_or_glyph_group glyph_options, options = {}
    UiBibz::Utils::GlyphChanger.new(glyph_options, options).render
  end

  # Stars Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_star content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Icons::Star.new(content, options, html_options, &block).render
  end

end
