require 'test_helper'

include UiBibz::Helpers
class ButtonTest < ActionView::TestCase

  test "button" do
    actual   = UiBibz::Ui::Core::Button.new('state', status: :success).render
    expected = "<button class=\"btn-success btn\">state</button>"

    assert_equal expected, actual
  end

  test 'button group' do
    actual = UiBibz::Ui::Core::ButtonGroup.new position: :vertical do
      UiBibz::Ui::Core::Button.new('state').render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group btn-group-vertical\" role=\"group\"><button class=\"btn-primary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'link button' do
    actual   = UiBibz::Ui::Core::ButtonLink.new('state', { url: users_path, status: :danger, glyph: 'add'}).render
    expected = "<a class=\"btn-danger btn\" href=\"/users\"><i class=\"glyph fa fa-add\"></i> state</a>"

    assert_equal expected, actual
  end

  test 'button outline' do
    actual   = UiBibz::Ui::Core::Button.new('state', status: :success, outline: true).render
    expected = "<button class=\"btn-success-outline btn\">state</button>"

    assert_equal expected, actual
  end

  test 'checkbox button checked' do
    actual   = UiBibz::Ui::Core::ButtonChoice.new('state', { state: :active }).render
    expected = "<label class=\"active btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" checked=\"checked\" />state</label>"

    assert_equal expected, actual
  end

  test 'checkbox button non checked' do
    actual   = UiBibz::Ui::Core::ButtonChoice.new('state', { name: 'state', id: 'state', input_html_options: { class: 'state'}}).render
    expected = "<label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" name=\"state\" id=\"state\" class=\"state\" />state</label>"

    assert_equal expected, actual
  end

  test 'button group choice checkbox' do
    actual = UiBibz::Ui::Core::ButtonGroup.new do
      concat UiBibz::Ui::Core::ButtonChoice.new('state1').render
      concat UiBibz::Ui::Core::ButtonChoice.new('state2').render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

  test 'button group choice radio' do
    actual = UiBibz::Ui::Core::ButtonGroup.new do
      concat UiBibz::Ui::Core::ButtonChoice.new('state1', type: :radio).render
      concat UiBibz::Ui::Core::ButtonChoice.new('state2', type: :radio).render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

  test 'button dropdown' do
      actual = UiBibz::Ui::Core::ButtonDropdown.new("Dropdown", type: :dropup, status: :success).tap do |d|
      d.link 'state'
      d.header 'header'
      d.link 'momo'
      d.divider
      d.link 'lolo'
    end.render
    expected = "<div class=\"btn-group dropup\" role=\"group\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></button><div class=\"dropdown-menu dropdown-menu-left\"><a class=\"dropdown-item\" href=\"#\">state</a><h6 class=\"dropdown-header\" role=\"presentation\">header</h6><a class=\"dropdown-item\" href=\"#\">momo</a><div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"#\">lolo</a></div></div>"

    assert_equal expected, actual
  end

  test 'button split dropdown' do
      actual = UiBibz::Ui::Core::ButtonSplitDropdown.new("Dropdown", type: :dropup, status: :primary).tap do |d|
      d.link 'state'
      d.header 'header'
      d.link 'momo'
      d.divider
      d.link 'lolo'
    end.render
    expected = "<div class=\"btn-group dropup\" role=\"group\"><button class=\"btn btn-primary\">Dropdown</button><button class=\"btn btn-primary dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\"><span class=\"caret\"></span><span class=\"sr-only\">Toggle Dropdown</span></button><div class=\"dropdown-menu dropdown-menu-left\"><a class=\"dropdown-item\" href=\"#\">state</a><h6 class=\"dropdown-header\" role=\"presentation\">header</h6><a class=\"dropdown-item\" href=\"#\">momo</a><div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"#\">lolo</a></div></div>"

    assert_equal expected, actual
  end

end
