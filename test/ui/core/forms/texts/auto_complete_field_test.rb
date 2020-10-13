# frozen_string_literal: true

require 'test_helper'

class AutoCompleteFieldTest < ActionView::TestCase
  test 'auto_complete_field' do
    options = options_for_select(Array.new(2) { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new('test', { option_tags: options }, { id: 'test' }).render
    expected = "<input type=\"text\" name=\"test\" id=\"test\" class=\"form-control auto-complete-field\" autocomplete=\"true\" list=\"test-datalist\" /><datalist id=\"test-datalist\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></datalist>"

    assert_equal expected, actual
  end

  test 'auto_complete_field with refresh button' do
    options = options_for_select(Array.new(2) { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new('test', { option_tags: options, refresh: { target: { url: '/' } } }, { id: 'test' }).render
    expected = "<div class=\"field-refresh input-group ui_surround_field\"><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control auto-complete-field\" autocomplete=\"true\" list=\"test-datalist\" /><datalist id=\"test-datalist\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></datalist><span data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#test-datalist&quot;,&quot;url&quot;:&quot;/&quot;,&quot;data&quot;:[]}}\" class=\"btn-secondary ui-bibz-connect btn input-refresh-button\"><i class=\"glyph fas fa-sync-alt\"></i> </span></div>"

    assert_equal expected, actual
  end

  test 'auto_complete_field with refresh button and append content' do
    options = options_for_select(Array.new(2) { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new('test', { option_tags: options, append: 'Append content', refresh: { target: { url: '/' } } }, { id: 'test' }).render
    expected = "<div class=\"field-refresh input-group ui_surround_field\"><span class=\"input-group-text\">Append content</span><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control auto-complete-field\" autocomplete=\"true\" list=\"test-datalist\" /><datalist id=\"test-datalist\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></datalist><span data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#test-datalist&quot;,&quot;url&quot;:&quot;/&quot;,&quot;data&quot;:[]}}\" class=\"btn-secondary ui-bibz-connect btn input-refresh-button\"><i class=\"glyph fas fa-sync-alt\"></i> </span></div>"

    assert_equal expected, actual
  end

  test 'auto_complete_field with prepend content' do
    options = options_for_select(Array.new(2) { |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new('test', { option_tags: options, prepend: 'Append content' }, { id: 'test' }).render
    expected = "<div class=\"input-group ui_surround_field\"><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control auto-complete-field\" autocomplete=\"true\" list=\"test-datalist\" /><datalist id=\"test-datalist\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></datalist><span class=\"input-group-text\">Append content</span></div>"

    assert_equal expected, actual
  end
end
