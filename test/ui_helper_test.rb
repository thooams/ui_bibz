require 'test_helper'

include UiBibz::Helpers
class UiHelperTest < ActionView::TestCase

  test 'nav' do
    nav do
      tab "<a href='#'>toto</a>"
    end
  end

  test 'breadcrumb' do
    actual = breadcrumb do |b|
      b.link 'Home', url: '#home', glyph: 'home'
      b.link 'Toto', { url: '#toto', status: :active }
    end
    expected = "<ol class=\"breadcrumb\"><li><i class=\"glyph fa fa-home\"></i>  <a href=\"#home\">Home</a></li><li class=\"active\"><a href=\"#toto\">Toto</a></li></ol>"

    assert_equal actual, expected
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
