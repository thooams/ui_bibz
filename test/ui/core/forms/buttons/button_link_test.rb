require 'test_helper'

class ButtonLinkTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test "button_link" do
    actual   = ui_button_link('state')
    expected = "<a class=\"btn-secondary btn\" role=\"button\" href=\"#\">state</a>"

    assert_equal expected, actual
  end

  test "button_link with url" do
    actual   = ui_button_link('state', url: '#new_url')
    expected = "<a class=\"btn-secondary btn\" role=\"button\" href=\"#new_url\">state</a>"

    assert_equal expected, actual
  end

  test "button_link with status" do
    actual   = ui_button_link('state', status: :success)
    expected = "<a class=\"btn-success btn\" role=\"button\" href=\"#\">state</a>"

    assert_equal expected, actual
  end

  test 'button_link outline' do
    actual   = ui_button_link('state', status: :success, outline: true)
    expected = "<a class=\"btn-outline-success btn\" role=\"button\" href=\"#\">state</a>"

    assert_equal expected, actual
  end

  test 'button_link disabled' do
    actual   = ui_button_link('state', state: :disabled)
    expected = "<a class=\"disabled btn-secondary btn\" disabled=\"disabled\" role=\"button\" href=\"#\">state</a>"

    assert_equal expected, actual
  end

  test 'button_link active' do
    actual   = ui_button_link('state', state: :active)
    expected = "<a class=\"active btn-secondary btn\" aria-pressed=\"true\" role=\"button\" href=\"#\">state</a>"

    assert_equal expected, actual
  end

  test 'button_link badge' do
    actual   = ui_button_link('state', badge: 2)
    expected = "<a class=\"btn-secondary btn\" role=\"button\" href=\"#\">state<span class=\"badge-secondary badge\">2</span></a>"

    assert_equal expected, actual
  end

  test 'button_link block' do
    actual   = ui_button_link('state', type: :block)
    expected = "<a class=\"btn-secondary btn btn-block\" role=\"button\" href=\"#\">state</a>"

    assert_equal expected, actual
  end

  test 'button_link size' do
    actual   = ui_button_link('state', size: :sm)
    expected = "<a class=\"btn-secondary btn btn-sm\" role=\"button\" href=\"#\">state</a>"

    assert_equal expected, actual
  end

  test 'button_link toggle' do
    actual   = ui_button_link('state', toggle: true)
    expected = "<a class=\"btn-secondary btn\" data-toggle=\"button\" aria-pressed=\"false\" autocomplete=\"off\" role=\"button\" href=\"#\">state</a>"

    assert_equal expected, actual
  end

  test 'button_link glyph' do
    actual   = ui_button_link('state', glyph: 'diamond')
    expected = "<a class=\"btn-secondary btn\" role=\"button\" href=\"#\"><i class=\"glyph fa fa-diamond\"></i> state</a>"

    assert_equal expected, actual
  end
end
