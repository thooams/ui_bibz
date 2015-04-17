require 'test_helper'
include UiBibz::Helpers
class ListGroupTest < ActionView::TestCase

  test 'list_group with link' do
    actual = UiBibz::Ui::ListGroup.new(type: :link).tap do |lg|
      lg.list 'Momo', { state: :success, url: '#momo' }
      lg.list({ tap: true, active: true, url: '#toto' }) do |l|
        l.header 'My title'
        l.body   'My body'
      end
    end.render
    expected = "<div class=\"list-group\"><a href=\"#momo\" class=\"list-group-item-success list-group-item\">Momo</a><a type=\"link\" href=\"#toto\" class=\"list-group-item\"><h4 class=\"list-group-item-heading\">My title</h4><p class=\"list-group-item-text\">My body</p></a></div>"

    assert_equal expected, actual
  end

  test 'list_group' do
    actual = UiBibz::Ui::ListGroup.new().tap do |lg|
      lg.list 'Lulu'
      lg.list 'Toto'
    end.render
    expected = "<ul class=\"list-group\"><li class=\"list-group-item\">Lulu</li><li class=\"list-group-item\">Toto</li></ul>"

    assert_equal expected, actual
  end

end
