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

  test 'range_field with in option' do
    actual = UiBibz::Ui::Core::Forms::Numbers::RangeField.new('myrange', value: 5, in: (0..10)).render
    expected = "<input type=\"range\" name=\"myrange\" id=\"myrange\" value=\"5\" class=\"form-range\" min=\"0\" max=\"10\" />"

    assert_equal expected, actual
  end

  test 'range_field with within option' do
    actual = UiBibz::Ui::Core::Forms::Numbers::RangeField.new('myrange', value: 2, within: (-2..4)).render
    expected = "<input type=\"range\" name=\"myrange\" id=\"myrange\" value=\"2\" class=\"form-range\" min=\"-2\" max=\"4\" />"

    assert_equal expected, actual
  end

  test 'range_field with tick' do
    actual = UiBibz::Ui::Core::Forms::Numbers::RangeField.new('myrange', value: 2, max: 3, tick: true)
    expected = "<input type=\"range\" name=\"myrange\" id=\"myrange\" value=\"2\" class=\"form-range\" max=\"3\" list=\"#{actual.html_id}-list\" /><datalist id=\"#{actual.html_id}-list\"><option value=\"0\" label=\"0\">0</option><option value=\"1\"></option><option value=\"2\" label=\"2\">2</option><option value=\"3\" label=\"3\">3</option></datalist>"

    assert_equal expected, actual.render
  end
end
