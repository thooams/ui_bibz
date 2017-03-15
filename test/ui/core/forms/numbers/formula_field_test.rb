require 'test_helper'
include UiBibz::Helpers

class FormulaFieldTest < ActionView::TestCase

    test 'formula_field' do
      actual = UiBibz::Ui::Core::Forms::Numbers::FormulaField.new('value').render
      expected = "<div class=\"input-group formula_field\"><input type=\"text\" name=\"value_formula\" id=\"value_formula\" class=\"formula-field form-control\" /><span class=\"formula-field-sign input-group-addon\">=</span><input type=\"text\" name=\"value\" id=\"value\" readonly=\"readonly\" class=\"formula-field-result form-control\" /><span class=\"formula-field-alert input-group-addon\" data-toggle=\"tooltip\"><i class=\"glyph-danger glyph fa fa-exclamation-triangle\"></i></span></div>"

      assert_equal expected, actual
    end
end
