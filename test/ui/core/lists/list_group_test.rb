require 'test_helper'

class ListGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'list_group with link' do
    actual = ui_list_group(type: :link) do |lg|
      lg.list 'Momo', { status: :success, url: '#momo' }
      lg.list({ tap: true, active: true, url: '#state' }) do |l|
        l.header 'My title'
        l.body   'My body'
      end
    end
    expected = "<ul class=\"list-group\"><li href=\"#momo\" class=\"list-group-item-success list-group-item\">Momo</li><li href=\"#state\" class=\"list-group-item flex-column align-items-start\"><div class=\"d-flex w-100 justify-content-between\"><h5 class=\"mb-1\">My title</h5><small></small></div><p class=\"mb-1\">My body</p><small></small></li></ul>"

    assert_equal expected, actual
  end

  test 'list_group' do
    actual = ui_list_group(type: :link) do |lg|
      lg.list 'Lulu'
      lg.list 'state'
    end
    expected = "<ul class=\"list-group\"><li class=\"list-group-item\">Lulu</li><li class=\"list-group-item\">state</li></ul>"

    assert_equal expected, actual
  end

end
