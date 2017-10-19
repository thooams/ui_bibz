# encoding: UTF-8
require 'test_helper'

class UiHelperTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'container' do
    actual   = ui_container type: :fluid
    expected = "<div class=\"container-fluid\"></div>"

    assert_equal expected, actual
  end
end
