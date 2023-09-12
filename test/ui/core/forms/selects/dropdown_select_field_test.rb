# frozen_string_literal: true

require 'test_helper'

class DropdownSelectFieldTest < ActionView::TestCase
  test 'Dropdown Select Field' do
    options  = options_for_select(Array.new(2) { |i| "option #{i}" })
    actual   = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('example', multiple: true, option_tags: options).render
    expected = "<select name=\"example[]\" id=\"example\" data-dropdown-classes=\"dropdown\" class=\"btn-secondary multi-select-field\" multiple=\"multiple\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></select>"

    assert_equal expected, actual
  end

  test 'Dropdown Select Field with fuzzy search' do
    options  = options_for_select(Array.new(2) { |i| "option #{i}" })
    actual   = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('example', option_tags: options, searchable: :fuzzy).render
    expected = "<select name=\"example\" id=\"example\" data-enable-filtering=\"true\" data-fuzzy-search=\"true\" data-dropdown-classes=\"dropdown\" class=\"btn-secondary multi-select-field\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></select>"

    assert_equal expected, actual
  end

  test 'Dropdown Select Field data html options' do
    grouped_options = { 'North America' => [['United statuss', 'US'], 'Canada'], 'Europe' => %w[Denmark Germany France] }
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('example', { multiple: true, option_tags: grouped_options_for_select(grouped_options), clickable_opt_group: true, collapsible_opt_group: true, searchable: true, non_selected_text: 'test', select_all_options: true, number_displayed: 2, status: :danger, n_selected_text: "items selected" }).render
    expected = "<select name=\"example[]\" id=\"example\" data-enable-clickable-opt-groups=\"true\" data-enable-collapsible-opt-groups=\"true\" data-enable-filtering=\"true\" data-non-selected-text=\"test\" data-include-select-all-option=\"true\" data-number-displayed=\"2\" data-dropdown-classes=\"dropdown\" data-n-selected-text=\"items selected\" class=\"btn-danger multi-select-field\" multiple=\"multiple\"><optgroup label=\"North America\"><option value=\"US\">United statuss</option>
<option value=\"Canada\">Canada</option></optgroup><optgroup label=\"Europe\"><option value=\"Denmark\">Denmark</option>
<option value=\"Germany\">Germany</option>
<option value=\"France\">France</option></optgroup></select>"

    assert_equal expected, actual
  end

  test 'Dropdown Select Field refresh option' do
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { multiple: true, refresh: { target: { url: '/' } } }).render
    expected = "<div class=\"field-refresh input-group ui_surround_field\"><select name=\"test[]\" id=\"test\" data-dropdown-classes=\"dropdown\" class=\"btn-secondary multi-select-field\" multiple=\"multiple\"></select><span data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#test&quot;,&quot;url&quot;:&quot;/&quot;,&quot;data&quot;:[]}}\" class=\"btn-secondary ui-bibz-connect btn input-refresh-button\"><i class=\"glyph fa-solid fa-sync-alt\"></i></span></div>"

    assert_equal expected, actual
  end
end
