module UiBibz::Helpers::UiHelper

  def panel options = nil, html_options = nil, &block
    UiBibz::Ui::Panel.new(options, html_options).tap(&block).render
  end

  def nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Nav.new(content, options, html_options, &block).render
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

  def grid options = nil, html_options = nil, &block
    UiBibz::Ui::Grid.new(options, html_options).tap(&block).render
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

  def link_button content, options = nil, html_options = nil, &block
    UiBibz::Ui::LinkButton.new(content, options, html_options, &block).render
  end

  def link_action content, options = nil, html_options = nil, &block
    UiBibz::Ui::LinkAction.new(content, options, html_options, &block).render
  end

  def glyph content
    UiBibz::Ui::Glyph.new(content).render
  end

end
