require 'test_helper'
include UiBibz::Helpers

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
end
