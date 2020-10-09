# frozen_string_literal: true

require 'test_helper'

class DropdownSelectFieldTest < ActionView::TestCase
  test 'dropdown_select_field' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', options_tags: options).render
    expected = '<select name="test" id="test" data-style="btn-secondary" class="dropdown-select-field"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field searchable' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { options_tags: options, searchable: true }).render
    expected = '<select name="test" id="test" data-live-search="true" data-style="btn-secondary" class="dropdown-select-field"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field max_options' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { options_tags: options, max_options: 2 }).render
    expected = '<select name="test" id="test" data-max-options="2" data-style="btn-secondary" class="dropdown-select-field"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field selected_text_format' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { options_tags: options, selected_text_format: 'count > x' }).render
    expected = '<select name="test" id="test" data-selected-text-format="count &gt; x" data-style="btn-secondary" class="dropdown-select-field"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field menu_size' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { options_tags: options, menu_size: 2 }).render
    expected = '<select name="test" id="test" data-size="2" data-style="btn-secondary" class="dropdown-select-field"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field actions_box' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { options_tags: options, actions_box: true }).render
    expected = '<select name="test" id="test" data-style="btn-secondary" data-actions-box="true" class="dropdown-select-field"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field show_tick' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { options_tags: options, show_tick: true }).render
    expected = '<select name="test" id="test" data-style="btn-secondary" class="dropdown-select-field show-tick"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field show_menu_arrow' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { options_tags: options, show_menu_arrow: true }).render
    expected = '<select name="test" id="test" data-style="btn-secondary" class="dropdown-select-field"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field dropup' do
    options = options_for_select(2.times.map { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { options_tags: options, dropup: true }).render
    expected = '<select name="test" id="test" data-style="btn-secondary" class="dropdown-select-field dropup"></select>'

    assert_equal expected, actual
  end

  test 'dropdown_select_field refresh' do
    actual = UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('test', { refresh: { mode: 'local', target: { data: [] } } }).render
    expected = '<div class="field-refresh input-group ui_surround_field"><select name="test" id="test" data-style="btn-secondary" class="dropdown-select-field"></select><span data-connect="{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;local&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#test&quot;,&quot;url&quot;:&quot;&quot;,&quot;data&quot;:[]}}" class="btn-secondary ui-bibz-connect btn input-refresh-button"><i class="glyph fas fa-sync-alt"></i> </span></div>'

    assert_equal expected, actual
  end
end
