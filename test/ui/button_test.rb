require 'test_helper'

include UiBibz::Helpers
class ButtonTest < ActionView::TestCase

  test "button" do
    actual   = UiBibz::Ui::Core::Button.new('toto', state: :success).render
    expected = "<button class=\"btn-success btn\">toto</button>"

    assert_equal expected, actual
  end

  test 'button group' do
    actual = UiBibz::Ui::Core::ButtonGroup.new position: :vertical do
      UiBibz::Ui::Core::Button.new('toto').render
    end.render
    expected = "<div class=\"btn-group btn-group-vertical\" role=\"group\"><button class=\"btn-default btn\">toto</button></div>"

    assert_equal expected, actual
  end

  test 'link button' do
    actual   = UiBibz::Ui::Core::ButtonLink.new('Toto', { url: users_path, state: :danger, glyph: 'add'}).render
    expected = "<a class=\"btn-danger btn\" href=\"/users\"><i class=\"glyph fa fa-add\"></i> Toto</a>"

    assert_equal expected, actual
  end

  test 'checkbox button' do
    actual   = UiBibz::Ui::Core::ButtonCheckbox.new('Toto', { status: :active }).render
    expected = ""

    assert_equal expected, actual
  end

  test 'button dropdown' do
      actual = UiBibz::Ui::Core::ButtonDropdown.new("Dropdown", type: :dropup, state: :success).tap do |d|
      d.link 'toto'
      d.header 'header'
      d.link 'momo'
      d.divider
      d.link 'lolo'
    end.render
    expected = "<div class=\"btn-group dropup\" role=\"group\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></button><ul class=\"dropdown-menu dropdown-menu-left\" role=\"menu\"><li class=\"\" role=\"presentation\"><a href=\"#\">toto</a></li><li class=\"dropdown-header\" role=\"presentation\">header</li><li class=\"\" role=\"presentation\"><a href=\"#\">momo</a></li><li class=\"divider\" role=\"separator\"></li><li class=\"\" role=\"presentation\"><a href=\"#\">lolo</a></li></ul></div>"

    assert_equal expected, actual
  end

  test 'button split dropdown' do
      actual = UiBibz::Ui::Core::ButtonSplitDropdown.new("Dropdown", type: :dropup, state: :primary).tap do |d|
      d.link 'toto'
      d.header 'header'
      d.link 'momo'
      d.divider
      d.link 'lolo'
    end.render
    expected = "<div class=\"btn-group dropup\" role=\"group\"><button class=\"btn btn-primary\">Dropdown</button><button class=\"btn btn-primary dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-expanded=\"false\"><span class=\"caret\"></span><span class=\"sr-only\">Toggle Dropdown</span></button><ul class=\"dropdown-menu dropdown-menu-left\" role=\"menu\"><li class=\"\" role=\"presentation\"><a href=\"#\">toto</a></li><li class=\"dropdown-header\" role=\"presentation\">header</li><li class=\"\" role=\"presentation\"><a href=\"#\">momo</a></li><li class=\"divider\" role=\"separator\"></li><li class=\"\" role=\"presentation\"><a href=\"#\">lolo</a></li></ul></div>"

    assert_equal expected, actual
  end


end
