require 'test_helper'

class ButtonLinkTest < ActionView::TestCase

  test 'link button' do
    actual   = UiBibz::Ui::Core::Forms::Buttons::ButtonLink.new('state', { url: users_path, status: :danger, glyph: 'add'}).render
    expected = "<a class=\"btn-danger btn\" href=\"/users\"><i class=\"glyph fa fa-add\"></i> state</a>"

    assert_equal expected, actual
  end
end
