# frozen_string_literal: true

require 'test_helper'

class CheckboxFieldTest < ActionView::TestCase
  test 'checkbox_field' do
    actual = UiBibz::Ui::Core::Forms::Choices::CheckboxField.new('John', { value: 1, status: :primary }).render
    expected = "<div class=\"form-check\"><input type=\"checkbox\" name=\"John\" id=\"John\" value=\"1\" class=\"form-check-input form-check-input-primary\" /><label class=\"form-check-label\" for=\"John\">John</label></div>"

    assert_equal expected, actual
  end

  test 'checkbox_field which is a boolean' do
    actual = UiBibz::Ui::Core::Forms::Choices::CheckboxField.new('John', { boolean: true, value: 1 }).render
    expected = "<div class=\"form-check\"><input type=\"hidden\" name=\"John\" id=\"John-hidden\" value=\"0\" /><input type=\"checkbox\" name=\"John\" id=\"John\" value=\"1\" class=\"form-check-input\" /><label class=\"form-check-label\" for=\"John\">John</label></div>"

    assert_equal expected, actual
  end
end
