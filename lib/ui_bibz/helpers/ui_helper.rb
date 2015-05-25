module UiBibz::Helpers::UiHelper

  def panel content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Core::Panel.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Panel.new(content, options, html_options, &block).render
    end
  end

  # Use "notify" instead of "alert" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def notify content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Alert.new(content, options, html_options, &block).render
  end

  # Use "etiquette" instead of "label" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def etiquette content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Label.new(content, options, html_options, &block).render
  end

  def jumbotron content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Jumbotron.new(content, options, html_options, &block).render
  end

  def nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Nav.new(content, options, html_options).tap(&block).render
  end

  def list_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ListGroup.new(content, options, html_options).tap(&block).render
  end

  def grid options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Grid.new(options, html_options).tap(&block).render
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

  # Button section begin ----------------------------------------------------

  def button_link content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonLink.new(content, options, html_options, &block).render
  end

  def button_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonGroup.new(content, options, html_options, &block).render
  end

  def button content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Button.new(content, options, html_options, &block).render
  end

  def button_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonDropdown.new(name, options, html_options).tap(&block).render
  end

  def button_split_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonSplitDropdown.new(name, options, html_options).tap(&block).render
  end

  # Button section end ----------------------------------------------------

  def breadcrumb content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Breadcrumb.new(content, options, html_options).tap(&block).render
  end

  def dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Dropdown.new(name, options, html_options).tap(&block).render
  end

  def glyph content, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Glyph.new(content, options, html_options, &block).render
  end

  def progress_bar percentage = nil, options = nil, html_options = nil, &block
    if is_tap(percentage, options)
      UiBibz::Ui::Core::ProgressBar.new(percentage, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::ProgressBar.new(percentage, options, html_options, &block).render
    end
  end

private

  def is_tap content, options
    (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
  end

end
