# frozen_string_literal: true

require 'test_helper'

class FileFieldTest < ActionView::TestCase
  test 'file_field' do
    actual = UiBibz::Ui::Core::Forms::Files::FileField.new('test').render
    expected = "<div class=\"form-file\"><input type=\"file\" name=\"test\" id=\"test\" class=\"form-file-input\" /><label class=\"form-file-label\" for=\"test\"><span class=\"form-file-text\"></span><span class=\"form-file-button\">Browse</span></label></div>"

    assert_equal expected, actual
  end
end
