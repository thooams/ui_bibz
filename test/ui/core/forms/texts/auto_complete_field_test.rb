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
end
