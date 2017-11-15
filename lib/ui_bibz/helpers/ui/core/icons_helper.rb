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

  # Stars Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_star content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Icons::Star.new(content, options, html_options, &block).render
  end
end
