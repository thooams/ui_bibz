module UiBibz::Helpers::UiHelper

  def panel content = nil, options = nil, html_options = nil, &block
    is_tap = (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
    if is_tap
      UiBibz::Ui::Panel.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Panel.new(content, options, html_options, &block).render
    end
  end

  # Use "notify" instead of "alert" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def notify content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Alert.new(content, options, html_options, &block).render
  end

  # Use "lab" instead of "label" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def lab content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Label.new(content, options, html_options, &block).render
  end

  def nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Nav.new(content, options, html_options).tap(&block).render
  end

  def list_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::ListGroup.new(content, options, html_options).tap(&block).render
  end

  def grid options = nil, html_options = nil, &block
    UiBibz::Ui::Grid.new(options, html_options).tap(&block).render
  end

  # Table section begin ------------------------------------------------------

  def table content = nil, options = nil, html_options = nil, &block
    is_tap = (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
    if is_tap
      UiBibz::Ui::Table.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Table.new(content, options, html_options, &block).render
    end
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

  def table_panel content = nil, options = nil, html_options = nil, &block
    is_tap = (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
    if is_tap
      UiBibz::Ui::TablePanel.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::TablePanel.new(content, options, html_options, &block).render
    end
  end

  # Table section end -------------------------------------------------------

  # Button section begin ----------------------------------------------------

  def button_link content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::ButtonLink.new(content, options, html_options, &block).render
  end

  def button_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::ButtonGroup.new(content, options, html_options, &block).render
  end

  def button content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Button.new(content, options, html_options, &block).render
  end

  def button_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::ButtonDropdown.new(name, options, html_options).tap(&block).render
  end

  def button_split_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::ButtonSplitDropdown.new(name, options, html_options).tap(&block).render
  end

  # Button section end ----------------------------------------------------

  def breadcrumb content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Breadcrumb.new(content, options, html_options).tap(&block).render
  end

  def dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Dropdown.new(name, options, html_options).tap(&block).render
  end

  def glyph content, options = nil, html_options = nil, &block
    UiBibz::Ui::Glyph.new(content, options, html_options, &block).render
  end

end
