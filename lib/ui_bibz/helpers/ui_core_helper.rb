module UiBibz::Helpers::UiCoreHelper

  # Button section begin ----------------------------------------------------

  # Button Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def button content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Button.new(content, options, html_options, &block).render
  end

  # Button Choice Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def button_choice content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonChoice.new(content, options, html_options, &block).render
  end

  # Button Dropdown Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def button_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonDropdown.new(name, options, html_options).tap(&block).render
  end

  # Button Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def button_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonGroup.new(content, options, html_options, &block).render
  end

  # Button Link Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def button_link content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonLink.new(content, options, html_options, &block).render
  end

  # Button Split Dropdown Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def button_split_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ButtonSplitDropdown.new(name, options, html_options).tap(&block).render
  end

  # Button section end ----------------------------------------------------

  # Card section begin ----------------------------------------------------

  # Card Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Option +tap: true+ is required if you want add +header+, +block+ or
  # +footer+.
  def card content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Core::Card.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Card.new(content, options, html_options, &block).render
    end
  end

  # Card Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def card_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::CardGroup.new(content, options, html_options).tap(&block).render
  end

  # Card Deck Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def card_deck content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::CardDeck.new(content, options, html_options).tap(&block).render
  end

  # Card Column Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def card_column content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::CardColumn.new(content, options, html_options).tap(&block).render
  end

  # Card section end ----------------------------------------------------

  # Input section begin ----------------------------------------------------

  # Date Picker Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def date_picker_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::DatePickerField.new(content, options, html_options, &block).render
  end

  # Markdown Editor Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def markdown_editor_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::MarkdownEditorField.new(content, options, html_options, &block).render
  end

  # Multi Column Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def multi_column_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::MultiColumnField.new(content, options, html_options, &block).render
  end

  # Multi Select Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def multi_select_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::MultiSelectField.new(content, options, html_options, &block).render
  end

  # Formula Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def formula_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::FormulaField.new(content, options, html_options, &block).render
  end

  # Surround Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def surround_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::SurroundField.new(content, options, html_options, &block).render
  end

  # Switch Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def switch_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::SwitchField.new(content, options, html_options, &block).render
  end

  # Dropdown Select Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def dropdown_select_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::DropdownSelectField.new(content, options, html_options, &block).render
  end

  # Autocomplete Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def autocomplete_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::AutocompleteField.new(content, options, html_options, &block).render
  end

  # Input section end ----------------------------------------------------

  # Nav section begin ----------------------------------------------------


  # Nav Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Nav.new(content, options, html_options).tap(&block).render
  end

  # Navbar Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def navbar content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Navbar.new(content, options, html_options).tap(&block).render
  end

  # Nav section end ----------------------------------------------------

  # Layout section begin ----------------------------------------------------

  # Row Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def row content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Row.new(content, options, html_options, &block).render
  end

  # Col Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def col content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Col.new(content, options, html_options, &block).render
  end

  # Container Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def container content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Container.new(content, options, html_options, &block).render
  end

  # Layout section end ----------------------------------------------------

  # Other section begin ----------------------------------------------------

  # Notify (Alert) Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Use "notify" instead of "alert" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def notify content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Alert.new(content, options, html_options, &block).render
  end

  # Breadcrumb Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  def breadcrumb content = nil, options = nil, html_options = nil, &block
    if is_tap(content, options)
      UiBibz::Ui::Core::Breadcrumb.new(content, options, html_options).tap(&block).render
    else
      UiBibz::Ui::Core::Breadcrumb.new(content, options, html_options, &block).render
    end
  end

  # Dropdown Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Dropdown.new(name, options, html_options).tap(&block).render
  end

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
  def glyph content, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Glyph.new(content, options, html_options, &block).render
  end

  # Jumbotron Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def jumbotron content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Jumbotron.new(content, options, html_options, &block).render
  end

  # Etiquette (Label) Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  #
  # Use "etiquette" instead of "label" : due to "actionview (4.2.0) lib/action_view/helpers/form_helper.rb" conflict
  def etiquette content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Label.new(content, options, html_options, &block).render
  end

  # List Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def list_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::ListGroup.new(content, options, html_options).tap(&block).render
  end

  # Modal Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def modal content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Modal.new(content, options, html_options).tap(&block).render
  end

  # Progress Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def progress percentage = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Progress.new(percentage, options, html_options, &block).render
  end

  # Stars Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def stars content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Stars.new(content, options, html_options, &block).render
  end

  # Other section end ----------------------------------------------------

private

  def is_tap content, options
    (content[:tap] if content.kind_of?(Hash)) || (options[:tap] unless options.nil?)
  end

end
