require 'test_helper'
include UiBibz::Helpers

class SelectFieldTest < ActionView::TestCase

    test "Select Field" do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual   = UiBibz::Ui::Core::Forms::Selects::SelectField.new('example', option_tags: options).render
      expected = "<select name=\"example\" id=\"example\" class=\"select-field form-control\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></select>"

      assert_equal expected, actual
    end

    test "Select Field refresh" do
      actual   = UiBibz::Ui::Core::Forms::Selects::SelectField.new('example', refresh: { target: { url: '/' }}).render
      expected = "<div class=\"input-group field-refresh\"><select name=\"example\" id=\"example\" class=\"select-field form-control\"></select><span class=\"input-group-btn\"><span data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#example&quot;,&quot;url&quot;:&quot;/&quot;,&quot;data&quot;:[]}}\" class=\"btn-primary ui-bibz-connect input-refresh-button btn\"><i class=\"glyph fa fa-refresh\"></i> </span></span></div>"

      assert_equal expected, actual
    end

end
