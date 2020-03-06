# frozen_string_literal: true

require 'test_helper'

class TextFieldTest < ActionView::TestCase
  test 'file_field' do
    actual = UiBibz::Ui::Core::Forms::Files::FileField.new('test').render
    expected = '<div class="custom-file"><input type="file" name="test" id="test" class="custom-file-input" /><label class="custom-file-label" for="test"></label></div>'

    assert_equal expected, actual
  end
end
