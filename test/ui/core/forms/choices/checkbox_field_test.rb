# frozen_string_literal: true

require 'test_helper'

class CheckboxFieldTest < ActionView::TestCase
  test 'checkbox_field' do
    actual = UiBibz::Ui::Core::Forms::Choices::CheckboxField.new('John', { value: 1 }).render
    expected = '<div class="custom-control custom-checkbox"><input type="hidden" name="John" id="John-hidden" value="0" /><input type="checkbox" name="John" id="John" value="1" class="custom-control-input" /><label class="custom-control-label" for="John">John</label></div>'

    assert_equal expected, actual
  end
end
