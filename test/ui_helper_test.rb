require 'test_helper'

include UiBibz::Helpers
class UiHelperTest < ActionView::TestCase

  test 'breadcrumb' do
    actual = breadcrumb do |b|
      b.link 'Home', url: '#home', glyph: 'home'
      b.link 'Toto', { url: '#toto', status: :active }
    end
    expected = "<ol class=\"breadcrumb\"><li><i class=\"glyph fa fa-home\"></i>  <a href=\"#home\">Home</a></li><li class=\"active\"><a href=\"#toto\">Toto</a></li></ol>"

    assert_equal expected, actual
  end

  test 'link action' do
    actual   = link_action 'Show', users_path, glyph: 'eye'
    expected = "<li role=\"presentation\"><a role=\"menuitem\" tabindex=\"-1\" href=\"/users\"><i class=\"glyph fa fa-eye fa-fw\"></i> Show</a></li>"

    assert_equal expected, actual
  end

  test 'alert' do
    actual = alert 'toto'
    expected = "<div class=\"alert-info alert\" role=\"alert\">toto</div>"

    assert_equal expected, actual
  end

end
