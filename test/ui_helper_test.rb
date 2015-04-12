require 'test_helper'

include UiBibz::Helpers
class UiHelperTest < ActionView::TestCase

  test 'nav' do
    nav do
      tab "<a href='#'>toto</a>"
    end
  end

  test 'button group' do
    actual = button_group do
      button 'toto'
    end
    expected = "<div class=\"btn-group\"><button class=\"btn btn-default\">toto</button></div>"

    assert_equal actual, expected
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

  test 'link button' do
    actual   = button_link 'Toto', users_path, { type: :danger, glyph: 'add'}
    expected = "<a class=\"btn btn-danger\" href=\"/users\"><i class=\"glyph fa fa-add\"></i> Toto</a>"

    assert_equal expected, actual
  end

  test 'link action' do
    actual   = link_action 'Show', users_path, glyph: 'eye'
    expected = "<li role=\"presentation\"><a role=\"menuitem\" tabindex=\"-1\" href=\"/users\"><i class=\"glyph fa fa-eye fa-fw\"></i> Show</a></li>"

    assert_equal expected, actual
  end

end
