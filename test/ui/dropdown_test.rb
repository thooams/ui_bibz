require 'test_helper'
include UiBibz::Helpers
class DropdownTest < ActionView::TestCase

  test 'Dropdown' do
    actual = UiBibz::Ui::Core::Dropdown.new("Dropdown", type: :dropup, status: :success).tap do |d|
      d.link 'Link 1', url: '#link1', glyph: 'eye'
      d.header 'header'
      d.link 'Link 2', url: '#link2'
      d.divider
      d.link 'Link3', url: '#link3'
    end.render
    expected = "<div class=\"dropup btn-group\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></button><div class=\"dropdown-menu dropdown-menu-left\"><a class=\"dropdown-item\" href=\"#link1\"><i class=\"glyph fa fa-eye\"></i> Link 1</a><h6 class=\"dropdown-header\" role=\"presentation\">header</h6><a class=\"dropdown-item\" href=\"#link2\">Link 2</a><div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"#link3\">Link3</a></div></div>"

    assert_equal expected, actual
  end

end
