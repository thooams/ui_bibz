require 'test_helper'

include UiBibz::Helpers
class UiHelperTest < ActionView::TestCase

  test 'nav' do
    nav do
      tab "<a href='#'>toto</a>"
    end
  end

  test 'breadcrumb' do
    breadcrumb do
      "<li><a>Home</a></li>"
      "<li class='active'>Toto</li>"
    end
  end

  test 'tab' do
    tab "<a href='#'>toto</a>", { active: true }, { class: 'tab'}
    tab "toto", active: true, selector: 'tab-en'
  end

  test 'link action' do
    actual   = link_action 'Show', users_path, glyph: 'eye'
    expected = "<li role=\"presentation\"><a role=\"menuitem\" tabindex=\"-1\" href=\"/users\"><i class=\"glyph fa fa-eye fa-fw\"></i> Show</a></li>"

    assert_equal expected, actual
  end

end
