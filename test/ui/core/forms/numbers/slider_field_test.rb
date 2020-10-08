# frozen_string_literal: true

require 'test_helper'

class SliderFieldTest < ActionView::TestCase
  test 'slider field' do
    actual = UiBibz::Ui::Core::Forms::Numbers::SliderField.new('myrange').render
    expected = "<div class=\"slider\"><div><div class=\"slider-inverse-left\" style=\"width: 100%\"></div><div class=\"slider-inverse-right\" style=\"width: 100%\"></div><div class=\"slider-range\" style=\"left: 0%; right: 0%\"></div><div class=\"slider-thumb slider-thumb-left\" style=\"left: 0%\"></div><div class=\"slider-thumb slider-thumb-right\" style=\"left: 100%\"></div></div><input type=\"range\" name=\"myrange_min\" id=\"myrange_min\" value=\"0\" max=\"100\" min=\"0\" step=\"1\" /><input type=\"range\" name=\"myrange_max\" id=\"myrange_max\" value=\"100\" max=\"100\" min=\"0\" step=\"1\" /></div>"

    assert_equal expected, actual
  end

  test 'slider field with options' do
    actual = UiBibz::Ui::Core::Forms::Numbers::SliderField.new('myrange', thumb_max: 2, thumb_min: -7, min: -9, max: 6, step: 2, input_name_max: "price_max", input_name_min: "price_min").render
    expected = "<div class=\"slider\" min=\"-9\" max=\"6\" step=\"2\"><div><div class=\"slider-inverse-left\" style=\"width: 100%\"></div><div class=\"slider-inverse-right\" style=\"width: 100%\"></div><div class=\"slider-range\" style=\"left: 13%; right: 26%\"></div><div class=\"slider-thumb slider-thumb-left\" style=\"left: 13%\"></div><div class=\"slider-thumb slider-thumb-right\" style=\"left: 74%\"></div></div><input type=\"range\" name=\"price_min\" id=\"price_min\" value=\"-7\" max=\"6\" min=\"-9\" step=\"2\" /><input type=\"range\" name=\"price_max\" id=\"price_max\" value=\"2\" max=\"6\" min=\"-9\" step=\"2\" /></div>"

    assert_equal expected, actual
  end

  test 'slider header' do
    actual = UiBibz::Ui::Core::Forms::Numbers::SliderHeader.new(nil, target: "test", thumb_min: -7, thumb_max: 2, label_min: "min", label_max: "max").render
    expected = "<div data-target=\"test\" class=\"slider-header\"><div class=\"slider-header-min\"><label>min</label><span>-7</span></div><div class=\"slider-header-max\"><label>max</label><span>2</span></div></div>"

    assert_equal expected, actual
  end
end
