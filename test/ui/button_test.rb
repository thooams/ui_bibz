require 'test_helper'

include UiBibz::Helpers
class ButtonTest < ActionView::TestCase

  test "button" do
    actual   = UiBibz::Ui::Button.new('toto', state: :success).render
    expected = "<button class=\"btn-success btn\">toto</button>"

    assert_equal expected, actual
  end

  test 'button group' do
    actual = UiBibz::Ui::ButtonGroup.new position: :vertical do
      UiBibz::Ui::Button.new('toto').render
    end.render
    expected = "<div class=\"btn-group btn-group-vertical\" role=\"role\"><button class=\"btn-default btn\">toto</button></div>"

    assert_equal expected, actual
  end

  test 'link button' do
    actual   = UiBibz::Ui::ButtonLink.new('Toto', { url: users_path, state: :danger, glyph: 'add'}).render
    expected = "<a class=\"btn-danger btn\" href=\"/users\"><i class=\"glyph fa fa-add\"></i> Toto</a>"

    assert_equal expected, actual
  end

  test 'button dropdown' do
      actual = UiBibz::Ui::ButtonDropdown.new("Dropdown", type: :dropup, state: :success).tap do |d|
      d.list 'toto'
      d.list 'header', type: :header
      d.list 'momo'
      d.list '---'
      d.list 'lolo'
    end.render
    expected = "<div class=\"btn-group dropup\" role=\"group\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></button><ul class=\"dropdown-menu dropdown-menu-left\" role=\"menu\"><li role=\"presentation\">toto</li><li class=\"dropdown-header\" role=\"presentation\">header</li><li role=\"presentation\">momo</li><li class=\"divider\" role=\"presentation\"></li><li role=\"presentation\">lolo</li></ul></div>"

    assert_equal expected, actual
  end

  test 'button split dropdown' do
      actual = UiBibz::Ui::ButtonSplitDropdown.new("Dropdown", type: :dropup, state: :primary).tap do |d|
      d.list 'toto'
      d.list 'header', type: :header
      d.list 'momo'
      d.list '---'
      d.list 'lolo'
    end.render
    expected = "<div class=\"btn-group dropup\" role=\"group\"><button class=\"btn btn-primary\">Dropdown</button><button class=\"btn btn-primary dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-expanded=\"false\"><span class=\"caret\"></span><span class=\"sr-only\">Toggle Dropdown</span></button><ul class=\"dropdown-menu dropdown-menu-left\" role=\"menu\"><li role=\"presentation\">toto</li><li class=\"dropdown-header\" role=\"presentation\">header</li><li role=\"presentation\">momo</li><li class=\"divider\" role=\"presentation\"></li><li role=\"presentation\">lolo</li></ul></div>"

    assert_equal expected, actual
  end


end
