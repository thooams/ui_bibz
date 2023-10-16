# frozen_string_literal: true

require 'test_helper'

class ComboboxFieldTest < ActionView::TestCase
  test 'comobobox_field' do
    actual = UiBibz::Ui::Core::Forms::Texts::ComboboxField.new('test', { url: root_url, debounce: 200 }, { id: 'test' }).render
    expected = "<div data-controller=\"combobox\" data-combobox-url-value=\"http://test.host/\" data-combobox-debounce-value=\"200\" class=\"combobox\"><input type=\"text\" name=\"test\" id=\"test\" data-action=\"keyup-&gt;combobox#search\" class=\"form-control combobox-field\" autocomplete=\"false\" /><div class=\"combobox-list\"><turbo-frame id=\"test-combobox-list\" src=\"\"></turbo-frame></div></div>"

    assert_equal expected, actual
  end

  test 'comobobox_field with prepend content' do
    actual = UiBibz::Ui::Core::Forms::Texts::ComboboxField.new('test', { prepend: 'Append content' }, { id: 'test' }).render
    expected = "<div class=\"input-group ui_surround_field\"><div data-controller=\"combobox\" class=\"combobox\"><input type=\"text\" name=\"test\" id=\"test\" data-action=\"keyup-&gt;combobox#search\" class=\"form-control combobox-field\" autocomplete=\"false\" /><div class=\"combobox-list\"><turbo-frame id=\"test-combobox-list\" src=\"\"></turbo-frame></div></div><span class=\"input-group-text\">Append content</span></div>"

    assert_equal expected, actual
  end
end
