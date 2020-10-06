# frozen_string_literal: true

require 'test_helper'

class FormulaFieldTest < ActionView::TestCase
  test 'formula_field' do
    actual = UiBibz::Ui::Core::Forms::Numbers::FormulaField.new('value').render
    expected = '<div class="formula_field input-group ui_surround_field"><input type="text" name="value_formula" id="value_formula" class="formula-field form-control" /><span class="formula-field-sign input-group-text">=</span><input type="text" name="value" id="value" class="formula-field-result form-control" readonly="readonly" /><span data-toggle="tooltip" class="formula-field-alert input-group-text"><i class="glyph-danger glyph fas fa-exclamation-triangle"></i></span></div>'

    assert_equal expected, actual
  end
end
