# frozen_string_literal: true

require 'test_helper'

class RangeFieldTest < ActionView::TestCase
  test 'range_field' do
    actual = UiBibz::Ui::Core::Forms::Numbers::RangeField.new('myrange').render
    expected = '<input type="range" name="myrange" id="myrange" class="form-range" />'

    assert_equal expected, actual
  end

  test 'range_field with options' do
    actual = UiBibz::Ui::Core::Forms::Numbers::RangeField.new('myrange', value: 5, min: -9, max: 6, step: 0.2).render
    expected = '<input type="range" name="myrange" id="myrange" value="5" class="form-range" min="-9" max="6" step="0.2" />'

    assert_equal expected, actual
  end
end
