module UiBibz::Helpers::UiHelper

  def panel content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Panel.new(options, html_options).tap(&block).render
  end

  def nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Nav.new(content, options, html_options).tap(&block).render
  end

  def list_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::ListGroup.new(content, options, html_options, &block).render
  end

  def tab content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Tab.new(content, options, html_options, &block).render
  end

  def list content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::List.new(content, options, html_options, &block).render
  end

  # Table section -----------------------------------------------------------

  def table options = nil, html_options = nil, &block
    UiBibz::Ui::Table.new(options, html_options).tap(&block).render
  end

  def table_search_field options, html_options = nil
    UiBibz::Ui::TableSearchField.new(options, html_options).render
  end

  def table_pagination_per_page options, html_options = nil
    UiBibz::Ui::TablePaginationPerPage.new(options, html_options).render
  end

  def table_pagination options, html_options = nil
    UiBibz::Ui::TablePagination.new(options, html_options).render
  end

  def table_panel options = nil, html_options = nil, &block
    UiBibz::Ui::TablePanel.new(options, html_options).tap(&block).render
  end

  def breadcrumb content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Breadcrumb.new(content, options, html_options, &block).render
  end

  def dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Dropdown.new(name, options, html_options).tab(&block).render
  end

  def dropdown_button name, options = nil, html_options = nil, &block
    UiBibz::Ui::DropdownButton.new(name, options, html_options).tab(&block).render
  end

  def button_link content, options = nil, html_options = nil, &block
    UiBibz::Ui::ButtonLink.new(content, options, html_options, &block).render
  end

  def button_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::ButtonGroup.new(content, options, html_options, &block).render
  end

  def button content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Button.new(content, options, html_options, &block).render
  end

  def link_action content, options = nil, html_options = nil, &block
    UiBibz::Ui::LinkAction.new(content, options, html_options, &block).render
  end

  def glyph name, options = nil, html_options = nil, &block
    UiBibz::Ui::Glyph.new(content).render
  end

end
