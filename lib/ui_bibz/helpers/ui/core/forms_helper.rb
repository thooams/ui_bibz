module UiBibz::Helpers::Ui::Core::FormsHelper

  # Button Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_button content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Buttons::Button.new(content, options, html_options, &block).render
  end

  # Button Choice Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_button_choice content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new(content, options, html_options, &block).render
  end

  # Button Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_button_group content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(content, options, html_options).tap(&block).render
  end

  # Button Link Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_button_link content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Buttons::ButtonLink.new(content, options, html_options, &block).render
  end

  # Date Picker Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_date_picker_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Dates::DatePickerField.new(content, options, html_options, &block).render
  end

  # Markdown Editor Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_markdown_editor_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new(content, options, html_options, &block).render
  end

  # Multi Column Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_multi_column_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new(content, options, html_options, &block).render
  end

  # Multi Select Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_multi_select_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new(content, options, html_options, &block).render
  end

  # Formula Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_formula_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Numbers::FormulaField.new(content, options, html_options, &block).render
  end

  # String Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_text_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Texts::TextField.new(content, options, html_options, &block).render
  end

  # Switch Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_switch_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Choices::SwitchField.new(content, options, html_options, &block).render
  end

  # Checkbox Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_checkbox_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Choices::CheckboxField.new(content, options, html_options, &block).render
  end

  # Radio Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_radio_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Choices::RadioField.new(content, options, html_options, &block).render
  end

  # Select Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_select_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Selects::SelectField.new(content, options, html_options, &block).render
  end

  # Dropdown Select Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_dropdown_select_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new(content, options, html_options, &block).render
  end

  # Auto Complete Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_auto_complete_field content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new(content, options, html_options, &block).render
  end

  # Surround Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_surround_field content = nil, options = nil, html_options = nil, &block
     UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(content, options, html_options).tap(&block).render
  end

end

