require 'test_helper'
include UiBibz::Helpers
class DropdownTest < ActionView::TestCase

  test 'Dropdown' do
    actual = UiBibz::Ui::Core::Dropdown.new("Dropdown", type: :dropup, state: :success).tap do |d|
      d.link 'Link 1', url: '#link1', glyph: 'eye'
      d.list 'header', type: :header
      d.link 'Link 2', url: '#link2'
      d.list '---'
      d.link 'Link3', url: '#link3'
    end.render
    expected = "<div class=\"dropup\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></button><ul class=\"dropdown-menu dropdown-menu-left\" role=\"menu\"><li role=\"presentation\"><a href=\"#link1\"><i class=\"glyph fa fa-eye\"></i> Link 1</a></li><li class=\"dropdown-header\" role=\"presentation\">header</li><li role=\"presentation\"><a href=\"#link2\">Link 2</a></li><li class=\"divider\" role=\"presentation\"></li><li role=\"presentation\"><a href=\"#link3\">Link3</a></li></ul></div>"

    assert_equal expected, actual
  end

end
