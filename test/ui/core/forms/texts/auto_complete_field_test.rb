require 'test_helper'
include UiBibz::Helpers

class AutoCompleteFieldTest < ActionView::TestCase

  test 'auto_complete_field' do
    options  = options_for_select(2.times.map{ |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new('test', { option_tags: options }, { id: 'test' }).render
    expected = "<input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" autocomplete=\"true\" list=\"test-datalist\" /><datalist id=\"test-datalist\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></datalist>"

    assert_equal expected, actual
  end

  test 'auto_complete_field with refresh button' do
    options  = options_for_select(2.times.map{ |i| "option #{i}" })
    actual = UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new('test', { option_tags: options, refresh: { target: { url: '/'}} }, { id: 'test' }).render
    expected = "<div class=\"input-group field-refresh\"><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" autocomplete=\"true\" list=\"test-datalist\" /><datalist id=\"test-datalist\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></datalist><span class=\"input-group-btn\"><span data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;&quot;,&quot;url&quot;:&quot;&quot;,&quot;data&quot;:[]}}\" class=\"btn-primary ui-bibz-connect input-refresh-button btn\"><i class=\"glyph fa fa-refresh\"></i> </span></span></div>"

    assert_equal expected, actual
  end
end
