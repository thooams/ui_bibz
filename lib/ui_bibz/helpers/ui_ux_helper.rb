module UiBibz::Helpers::UiUxHelper

  # Table section begin ------------------------------------------------------

  # Table Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Option +tap: true+ is required if you want add +header+, +block+ or
  # +footer+.
  def table content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Ux::Table.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Ux::Table.new(content, options, html_options, &block).render
    end
  end

  # Table Search Field Component
  #
  # +options+ (Hash) [Required]
  # +html_options+ (Hash)
  def table_search_field options, html_options = nil
    UiBibz::Ui::Ux::TableSearchField.new(options, html_options).render
  end

  # Table Pagination Per Page Component
  #
  # +options+ (Hash) [Required]
  # +html_options+ (Hash)
  def table_pagination_per_page options, html_options = nil
    UiBibz::Ui::Ux::TablePaginationPerPage.new(options, html_options).render
  end

  # Table Pagination Component
  #
  # +options+ (Hash) [Required]
  # +html_options+ (Hash)
  def table_pagination options, html_options = nil
    UiBibz::Ui::Ux::TablePagination.new(options, html_options).render
  end

  # Glyph and Text method
  #
  # Merge glyph and text with html_safe
  def glyph_and_text glyph_args, text
    "#{ glyph glyph_args } #{ text }".html_safe
  end

  # Table Pagination Component
  #
  # +options+ (Hash) [Required]
  # +html_options+ (Hash)
  #
  # Option +tap: true+ is required if you want add +header+, +block+ or
  # +footer+.
  def table_card content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Ux::TableCard.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Ux::TableCard.new(content, options, html_options, &block).render
    end
  end

  # Table section end -------------------------------------------------------

private

  def is_tap content, options
    (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
  end

end
