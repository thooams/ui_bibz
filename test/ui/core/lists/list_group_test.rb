# frozen_string_literal: true

require 'test_helper'

class ListGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'list_group with link' do
    actual = ui_list_group(tag_type: :a) do |lg|
      lg.list 'Momo', { status: :success, url: '#momo' }
      lg.list(active: true, url: '#state') do |l|
        l.header 'My title'
        l.body   'My body'
      end
    end
    expected = "<div class=\"list-group\"><a href=\"#momo\" class=\"list-group-item-success list-group-item list-group-item-action\">Momo</a><a href=\"#state\" class=\"list-group-item list-group-item-action\"><div class=\"d-flex w-100 justify-content-between\"><h5 class=\"mb-1\">My title</h5><small></small></div><p class=\"mb-1\">My body</p><small></small></a></div>"

    assert_equal expected, actual
  end

  test 'list_group' do
    actual = ui_list_group do |lg|
      lg.list 'Lulu'
      lg.list 'state'
    end
    expected = '<ul class="list-group"><li class="list-group-item">Lulu</li><li class="list-group-item">state</li></ul>'

    assert_equal expected, actual
  end

  test 'list with a tag' do
    actual = ui_list_group(tag_type: :a) do |lg|
      lg.list 'Lulu'
      lg.list 'state'
    end
    expected = '<div class="list-group"><a class="list-group-item list-group-item-action">Lulu</a><a class="list-group-item list-group-item-action">state</a></div>'

    assert_equal expected, actual
  end

  test 'list with a li' do
    actual = ui_list_group(tag_type: :li) do |lg|
      lg.list 'Lulu'
      lg.list 'state'
    end
    expected = '<ul class="list-group"><li class="list-group-item">Lulu</li><li class="list-group-item">state</li></ul>'

    assert_equal expected, actual
  end

  test 'list with a button' do
    actual = ui_list_group(tag_type: :button) do |lg|
      lg.list 'Lulu'
      lg.list 'state'
    end
    expected = '<div class="list-group"><button class="list-group-item list-group-item-action">Lulu</button><button class="list-group-item list-group-item-action">state</button></div>'

    assert_equal expected, actual
  end
end
