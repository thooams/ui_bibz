require 'test_helper'

class FormulaFieldTest < ActionView::TestCase

    test 'formula_field' do
      actual = UiBibz::Ui::Core::Forms::Numbers::FormulaField.new('value').render
      expected = "<div class=\"formula_field input-group\"><input type=\"text\" name=\"value_formula\" id=\"value_formula\" class=\"formula-field form-control\" /><span class=\"formula-field-sign input-group-addon\">=</span><input type=\"text\" name=\"value\" id=\"value\" class=\"formula-field-result form-control\" readonly=\"readonly\" /><span data-toggle=\"tooltip\" class=\"formula-field-alert input-group-addon\"><i class=\"glyph-danger glyph fa fa-exclamation-triangle\"></i></span></div>"

      assert_equal expected, actual
    end
end
