require 'test_helper'
include UiBibz::Helpers
class DropdownTest < ActionView::TestCase

  test 'Dropdown' do
    actual = UiBibz::Ui::Dropdown.new("Dropdown", type: :dropup, state: :success).tap do |d|
      d.list 'toto'
      d.list 'header', type: :header
      d.list 'momo'
      d.list '---'
      d.list 'lolo'
    end.render
    expected = "<div class=\"dropup\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></button><ul class=\"dropdown-menu dropdown-menu-left\" role=\"menu\"><li role=\"presentation\">toto</li><li class=\"dropdown-header\" role=\"presentation\">header</li><li role=\"presentation\">momo</li><li class=\"divider\" role=\"presentation\"></li><li role=\"presentation\">lolo</li></ul></div>"

    assert_equal expected, actual
  end

end
