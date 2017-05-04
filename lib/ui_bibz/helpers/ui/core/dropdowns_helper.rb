module UiBibz::Helpers::Ui::Core::DropdownsHelper

  # Dropdown Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Dropdowns::Dropdown.new(name, options, html_options).tap(&block).render
  end

  # Split Dropdown Component
  #
  # +name+ (String) [Required]
  # +options+ (Hash)
  # +html_options+ (Hash)
  def ui_split_dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Core::Dropdowns::SplitDropdown.new(name, options, html_options).tap(&block).render
  end

end
