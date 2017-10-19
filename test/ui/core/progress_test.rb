# encoding: UTF-8
require 'test_helper'

class UiHelperTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'progress bar' do
    actual = ui_progress(20)
    expected = "<progress class=\"progress\" max=\"100\" value=\"20\">20</progress>"

    assert_equal expected, actual
  end

end
