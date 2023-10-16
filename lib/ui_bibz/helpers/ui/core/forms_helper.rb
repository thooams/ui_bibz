# frozen_string_literal: true

module UiBibz::Helpers::Ui::Core::FormsHelper
  # Button Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_button(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Buttons::Button.new(content, options, html_options, &).render
  end

  # Choice group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_choice_group(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new(content, options, html_options).tap(&).render
  end

  # Button Group Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_button_group(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(content, options, html_options).tap(&).render
  end

  # Button Link Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_button_link(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Buttons::ButtonLink.new(content, options, html_options, &).render
  end

  # Date Picker Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_date_picker_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Dates::DatePickerField.new(content, options, html_options, &).render
  end

  # Markdown Editor Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_markdown_editor_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Textareas::MarkdownEditorField.new(content, options, html_options, &).render
  end

  # Multi Column Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_multi_column_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new(content, options, html_options, &).render
  end

  # Multi Select Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_multi_select_field(content = nil, options = nil, html_options = nil, &)
    options = (options || {}).merge(multiple: true)
    UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new(content, options, html_options, &).render
  end

  # Formula Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_formula_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Numbers::FormulaField.new(content, options, html_options, &).render
  end

  # String Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_text_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Texts::TextField.new(content, options, html_options, &).render
  end

  # Box Switch Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_box_switch_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Choices::BoxSwitchField.new(content, options, html_options, &).render
  end

  # Switch Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_switch_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Choices::SwitchField.new(content, options, html_options, &).render
  end

  # Checkbox Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_checkbox_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Choices::CheckboxField.new(content, options, html_options, &).render
  end

  # Radio Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_radio_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Choices::RadioField.new(content, options, html_options, &).render
  end

  # Select Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_select_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Selects::SelectField.new(content, options, html_options, &).render
  end

  # Dropdown Select Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_dropdown_select_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new(content, options, html_options, &).render
  end

  # Auto Complete Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_auto_complete_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new(content, options, html_options, &).render
  end

  # Surround Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_surround_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(content, options, html_options).tap(&).render
  end

  # Dropdown Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_dropdown(name, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new(name, options, html_options).tap(&).render
  end

  # Split Dropdown Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_split_dropdown(name, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Dropdowns::SplitDropdown.new(name, options, html_options).tap(&).render
  end

  # Number Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_number_field(name, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Numbers::NumberField.new(name, options, html_options, &).render
  end

  # Range Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_range_field(name, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Numbers::RangeField.new(name, options, html_options, &).render
  end

  # Slider Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_slider_field(name, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Numbers::SliderField.new(name, options, html_options, &).render
  end

  # Slider Header Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_slider_header(options, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Numbers::SliderHeader.new(nil, options, html_options, &).render
  end

  # File Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_file_field(name, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Files::FileField.new(name, options, html_options, &).render
  end

  # Combobox Field Component
  #
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_combobox_field(content = nil, options = nil, html_options = nil, &)
    UiBibz::Ui::Core::Forms::Texts::ComboboxField.new(content, options, html_options, &).render
  end
end
