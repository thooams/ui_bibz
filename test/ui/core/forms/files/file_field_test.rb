# frozen_string_literal: true

require 'test_helper'

class FileFieldTest < ActionView::TestCase
  test 'file_field' do
    actual = UiBibz::Ui::Core::Forms::Files::FileField.new('test').render
    expected = "<input type=\"file\" name=\"test\" id=\"test\" value=\"\" class=\"form-control\" />"

    assert_equal expected, actual
  end
end
