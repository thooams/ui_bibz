require 'test_helper'

class ButtonTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test "button" do
    actual   = ui_button('state', status: :success)
    expected = "<button class=\"btn-success btn\">state</button>"

    assert_equal expected, actual
  end

  test 'button outline' do
    actual   = ui_button('state', status: :success, outline: true)
    expected = "<button class=\"btn-outline-success btn\">state</button>"

    assert_equal expected, actual
  end

  test 'button disabled' do
    actual   = ui_button('state', status: :success, state: :disabled)
    expected = "<button class=\"disabled btn-success btn\" disabled=\"disabled\">state</button>"

    assert_equal expected, actual
  end

  test 'button active' do
    actual   = ui_button('state', status: :success, state: :active)
    expected = "<button class=\"active btn-success btn\" aria-pressed=\"true\">state</button>"

    assert_equal expected, actual
  end
end
