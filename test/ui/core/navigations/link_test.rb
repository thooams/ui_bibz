require 'test_helper'
class LinkTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Link' do
    actual = ui_link 'My link', url: "#link"
    expected = "<a href=\"#link\">My link</a>"

    assert_equal expected, actual
  end

  test 'Link without text' do
    actual = ui_link 'My link', glyph: "gem", text: false, url: "#link"
    expected = "<a href=\"#link\"><i title=\"My link\" class=\"glyph fas fa-gem\"></i></a>"

    assert_equal expected, actual
  end

  test "Link with collapse option" do
    actual = ui_link 'My link', url: "#link", collapse: 'collapse-id'
    expected = "<a role=\"button\" data-toggle=\"collapse\" data-target=\"#collapse-id\" href=\"#link\">My link</a>"

    assert_equal expected, actual
  end

end
