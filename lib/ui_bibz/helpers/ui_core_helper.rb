module UiBibz::Helpers::UiCoreHelper

  # Button section begin ----------------------------------------------------
  def button content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Button.new(content, options, html_options, &block).render
  end

  def button_choice content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonChoice.new(content, options, html_options, &block).render
  end

  def button_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonDropdown.new(name, options, html_options).tap(&block).render
  end

  def button_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonGroup.new(content, options, html_options, &block).render
  end

  def button_link content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonLink.new(content, options, html_options, &block).render
  end

  def button_split_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonSplitDropdown.new(name, options, html_options).tap(&block).render
  end
  # Button section end ----------------------------------------------------

  # Card section begin ----------------------------------------------------
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
  # Card section end ----------------------------------------------------

  # Input section begin ----------------------------------------------------
  def date_picker_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::DatePickerField.new(content, options, html_options, &block).render
  end

  def multi_column_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::MultiColumnField.new(content, options, html_options, &block).render
  end

  def multi_select_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::MultiSelectField.new(content, options, html_options, &block).render
  end

  def formula_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::FormulaField.new(content, options, html_options, &block).render
  end

  def surround_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::SurroundField.new(content, options, html_options, &block).render
  end

  def switch_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::SwitchField.new(content, options, html_options, &block).render
  end

  def dropdown_select_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::DropdownSelectField.new(content, options, html_options, &block).render
  end

  def autocomplete_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::AutocompleteField.new(content, options, html_options, &block).render
  end
  # Input section end ----------------------------------------------------

  # Nav section begin ----------------------------------------------------
  def nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Nav.new(content, options, html_options).tap(&block).render
  end

  def navbar content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navbar.new(content, options, html_options).tap(&block).render
  end
  # Nav section end ----------------------------------------------------

  # Layout section begin ----------------------------------------------------
  def row content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Row.new(content, options, html_options, &block).render
  end

  def col content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Col.new(content, options, html_options, &block).render
  end

  def container content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Container.new(content, options, html_options, &block).render
  end
  # Layout section end ----------------------------------------------------

  # Other section begin ----------------------------------------------------
  # Use "notify" instead of "alert" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def notify content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Alert.new(content, options, html_options, &block).render
  end

  def breadcrumb content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Core::Breadcrumb.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Breadcrumb.new(content, options, html_options, &block).render
    end
  end

  def dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Dropdown.new(name, options, html_options).tap(&block).render
  end

  def glyph content, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Glyph.new(content, options, html_options, &block).render
  end

  def jumbotron content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Jumbotron.new(content, options, html_options, &block).render
  end

  # Use "etiquette" instead of "label" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def etiquette content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Label.new(content, options, html_options, &block).render
  end

  def list_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ListGroup.new(content, options, html_options).tap(&block).render
  end

  def modal content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Modal.new(content, options, html_options).tap(&block).render
  end

  def progress percentage = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Progress.new(percentage, options, html_options, &block).render
  end

  def stars content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Stars.new(content, options, html_options, &block).render
  end
  # Other section end ----------------------------------------------------

private

  def is_tap content, options
    (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
  end

end
