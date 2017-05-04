require 'test_helper'

class ListGroupTest < ActionView::TestCase

  test 'list_group with link' do
    actual = UiBibz::Ui::Core::Lists::ListGroup.new(type: :link).tap do |lg|
      lg.list 'Momo', { status: :success, url: '#momo' }
      lg.list({ tap: true, active: true, url: '#state' }) do |l|
        l.header 'My title'
        l.body   'My body'
      end
    end.render
    expected = "<div class=\"list-group\"><a class=\"list-group-item-success list-group-item\" href=\"#momo\">Momo</a><a type=\"link\" class=\"list-group-item\" href=\"#state\"><h4 class=\"list-group-item-heading\">My title</h4><p class=\"list-group-item-text\">My body</p></a></div>"

    assert_equal expected, actual
  end

  test 'list_group' do
    actual = UiBibz::Ui::Core::Lists::ListGroup.new().tap do |lg|
      lg.list 'Lulu'
      lg.list 'state'
    end.render
    expected = "<ul class=\"list-group\"><li class=\"list-group-item\">Lulu</li><li class=\"list-group-item\">state</li></ul>"

    assert_equal expected, actual
  end

end
