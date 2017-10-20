require 'test_helper'

class ButtonTest < ActionView::TestCase

  test "button" do
    actual   = UiBibz::Ui::Core::Forms::Buttons::Button.new('state', status: :success).render
    expected = "<button class=\"btn-success btn\">state</button>"

    assert_equal expected, actual
  end

  test 'button outline' do
    actual   = UiBibz::Ui::Core::Forms::Buttons::Button.new('state', status: :success, outline: true).render
    expected = "<button class=\"btn-outline-success btn\">state</button>"

    assert_equal expected, actual
  end

  test 'button disabled' do
    actual   = UiBibz::Ui::Core::Forms::Buttons::Button.new('state', status: :success, state: :disabled).render
    expected = "<button class=\"disabled btn-success btn\" disabled=\"disabled\">state</button>"

    assert_equal expected, actual
  end

  test 'button active' do
    actual   = UiBibz::Ui::Core::Forms::Buttons::Button.new('state', status: :success, state: :active).render
    expected = "<button class=\"active btn-success btn\" aria-pressed=\"true\">state</button>"

    assert_equal expected, actual
  end
end
