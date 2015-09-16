module UiBibz::Helpers::UiCoreHelper

  def card content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Core::Card.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Card.new(content, options, html_options, &block).render
    end
  end

  def card_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::CardGroup.new(content, options, html_options).tap(&block).render
  end

  def card_deck content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::CardDeck.new(content, options, html_options).tap(&block).render
  end

  def card_column content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::CardColumn.new(content, options, html_options).tap(&block).render
  end

  def modal content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Modal.new(content, options, html_options).tap(&block).render
  end

  # Use "notify" instead of "alert" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def notify content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Alert.new(content, options, html_options, &block).render
  end

  def stars content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Stars.new(content, options, html_options, &block).render
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

  def navbar content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navbar.new(content, options, html_options).tap(&block).render
  end

  def list_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ListGroup.new(content, options, html_options).tap(&block).render
  end


  # Button section begin ----------------------------------------------------
  def button_link content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonLink.new(content, options, html_options, &block).render
  end

  def button_choice content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonChoice.new(content, options, html_options, &block).render
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

  def row content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Row.new(content, options, html_options, &block).render
  end

  def col content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Col.new(content, options, html_options, &block).render
  end

  def container content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Container.new(content, options, html_options, &block).render
  end

private

  def is_tap content, options
    (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
  end

end
