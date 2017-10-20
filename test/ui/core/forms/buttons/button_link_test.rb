require 'test_helper'

class ButtonLinkTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'link button' do
    actual   = button_link('state', { url: users_path, status: :danger, glyph: 'add'})
    expected = "<a class=\"btn-danger btn\" role=\"button\" href=\"/users\"><i class=\"glyph fa fa-add\"></i> state</a>"

    assert_equal expected, actual
  end
end
