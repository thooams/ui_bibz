require 'test_helper'
include UiBibz::Helpers

class FormulaFieldTest < ActionView::TestCase

    test 'formula_field' do
      actual = UiBibz::Ui::Core::Forms::Numbers::FormulaField.new('value').render
      expected = "<div class=\"input-group formula_field\"><input type=\"text\" name=\"value_formula\" id=\"value_formula\" value=\"\" class=\"formula_field_input form-control\" /><span class=\"formula_field_sign input-group-addon\">=</span><input type=\"text\" name=\"value\" id=\"value\" readonly=\"readonly\" class=\"formula_field_result form-control\" /><span class=\"formula_field_alert input-group-addon\" data-toggle=\"tooltip\"><i class=\"glyph-danger glyph fa fa-exclamation-triangle\"></i></span></div>"

      assert_equal expected, actual
    end
end
