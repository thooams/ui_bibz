module UiBibz::Helpers::Ui::UxHelper

  # Table Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Option +tap: true+ is required if you want add +header+, +block+ or
  # +footer+.
  def ui_table content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Ux::Tables::Table.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Ux::Tables::Table.new(content, options, html_options, &block).render
    end
  end

  # Table Search Field Component
  #
  # +options+ (Hash) [Required]
  # +html_options+ (Hash)
  def ui_table_search_field options, html_options = nil
    UiBibz::Ui::Ux::Tables::TableSearchField.new(options, html_options).render
  end

  # Table Pagination Per Page Component
  #
  # +options+ (Hash) [Required]
  # +html_options+ (Hash)
  def ui_table_pagination_per_page options, html_options = nil
    UiBibz::Ui::Ux::Tables::TablePaginationPerPage.new(options, html_options).render
  end

  # Table Pagination Component
  #
  # +options+ (Hash) [Required]
  # +html_options+ (Hash)
  def ui_table_pagination options, html_options = nil
    UiBibz::Ui::Ux::Tables::TablePagination.new(options, html_options).render
  end

  # Glyph and Text method
  #
  # Merge glyph and text with html_safe
  def ui_glyph_and_text glyph_args, text
    "#{ ui_glyph glyph_args } #{ text }".html_safe
  end

  # Table Pagination Component
  #
  # +options+ (Hash) [Required]
  # +html_options+ (Hash)
  #
  # Option +tap: true+ is required if you want add +header+, +block+ or
  # +footer+.
  def ui_table_card content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Ux::Tables::TableCard.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Ux::Tables::TableCard.new(content, options, html_options, &block).render
    end
  end

end
