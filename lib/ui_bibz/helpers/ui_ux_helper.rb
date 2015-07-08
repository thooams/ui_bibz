module UiBibz::Helpers::UiUxHelper

  def grid options = nil, html_options = nil, &block
    UiBibz::Ui::Ux::Grid.new(options, html_options).tap(&block).render
  end

  # Table section begin ------------------------------------------------------
  def table content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Ux::Table.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Ux::Table.new(content, options, html_options, &block).render
    end
  end

  def table_search_field options, html_options = nil
    UiBibz::Ui::Ux::TableSearchField.new(options, html_options).render
  end

  def table_pagination_per_page options, html_options = nil
    UiBibz::Ui::Ux::TablePaginationPerPage.new(options, html_options).render
  end

  def table_pagination options, html_options = nil
    UiBibz::Ui::Ux::TablePagination.new(options, html_options).render
  end

  def table_panel content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Ux::TablePanel.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Ux::TablePanel.new(content, options, html_options, &block).render
    end
  end
  # Table section end -------------------------------------------------------

private

  def is_tap content, options
    (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
  end

end
