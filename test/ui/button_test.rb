require 'test_helper'

include UiBibz::Helpers
class ButtonTest < ActionView::TestCase

  test "button" do
    actual   = UiBibz::Ui::Button.new('toto', state: :success).render
    expected = "<button class=\"btn-success btn\">toto</button>"

    assert_equal actual, expected
  end

  test 'button group' do
    actual = UiBibz::Ui::ButtonGroup.new() do
      UiBibz::Ui::Button.new('toto').render
    end.render
    expected = "<div class=\"btn-group\"><button class=\"btn-default btn\">toto</button></div>"

    assert_equal actual, expected
  end

  test 'link button' do
    actual   = UiBibz::Ui::ButtonLink.new('Toto', { url: users_path, state: :danger, glyph: 'add'}).render
    expected = "<a class=\"btn-danger btn\" href=\"/users\"><i class=\"glyph fa fa-add\"></i> Toto</a>"

    assert_equal expected, actual
  end

end
