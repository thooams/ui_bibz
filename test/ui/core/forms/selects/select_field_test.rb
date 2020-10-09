# frozen_string_literal: true

require 'test_helper'

class SelectFieldTest < ActionView::TestCase
  test 'Select Field' do
    options  = options_for_select(2.times.map { |i| "option #{i}" })
    actual   = UiBibz::Ui::Core::Forms::Selects::SelectField.new('example', option_tags: options).render
    expected = "<select name=\"example\" id=\"example\" class=\"select-field form-control form-select\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></select>"

    assert_equal expected, actual
  end

  test 'Select Field refresh' do
    actual   = UiBibz::Ui::Core::Forms::Selects::SelectField.new('example', refresh: { target: { url: '/' } }).render
    expected = '<div class="field-refresh input-group ui_surround_field"><select name="example" id="example" class="select-field form-control form-select"></select><span data-connect="{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#example&quot;,&quot;url&quot;:&quot;/&quot;,&quot;data&quot;:[]}}" class="btn-secondary ui-bibz-connect btn input-refresh-button"><i class="glyph fas fa-sync-alt"></i> </span></div>'

    assert_equal expected, actual
  end
end
