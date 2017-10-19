require 'test_helper'
class DropdownTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Dropdown' do
    actual = ui_dropdown("Dropdown", type: :dropup, status: :success) do |d|
      d.link 'Link 1', url: '#link1', glyph: 'eye'
      d.header 'header'
      d.link 'Link 2', url: '#link2'
      d.divider
      d.link 'Link3', url: '#link3'
    end
    expected = "<div class=\"dropup btn-group\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></button><div class=\"dropdown-menu dropdown-menu-left\"><a class=\"dropdown-item\" href=\"#link1\"><i class=\"glyph fa fa-eye\"></i> Link 1</a><h6 class=\"dropdown-header\" role=\"presentation\">header</h6><a class=\"dropdown-item\" href=\"#link2\">Link 2</a><div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"#link3\">Link3</a></div></div>"

    assert_equal expected, actual
  end

  test 'Split Dropdown' do
    actual = ui_dropdown("Split Dropdown", type: :dropup, status: :primary) do |d|
      d.link 'state'
      d.header 'header'
      d.link 'momo'
      d.divider
      d.link 'lolo'
    end
    expected = "<div class=\"btn-group dropup\"><button class=\"btn btn-primary\">Split Dropdown</button><button class=\"btn btn-primary dropdown-toggle dropdown-toggle-split\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\"><span class=\"sr-only\">Toggle Dropdown</span></button><div class=\"dropdown-menu dropdown-menu-left\"><a class=\"dropdown-item\" href=\"#\">state</a><h6 class=\"dropdown-header\" role=\"presentation\">header</h6><a class=\"dropdown-item\" href=\"#\">momo</a><div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"#\">lolo</a></div></div>"

    assert_equal expected, actual
  end

end
