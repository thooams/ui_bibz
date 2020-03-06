# frozen_string_literal: true

require 'test_helper'

class NumberFieldTest < ActionView::TestCase
  test 'number_field' do
    actual = UiBibz::Ui::Core::Forms::Numbers::NumberField.new('mynumber').render
    expected = '<input type="number" name="mynumber" id="mynumber" class="form-control" />'

    assert_equal expected, actual
  end

  test 'number_field with options' do
    actual = UiBibz::Ui::Core::Forms::Numbers::NumberField.new('mynumber', value: 5, min: -9, max: 6, step: 0.2).render
    expected = '<input type="number" name="mynumber" id="mynumber" value="5" class="form-control" min="-9" max="6" step="0.2" />'

    assert_equal expected, actual
  end
end
