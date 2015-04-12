require 'test_helper'
include UiBibz::Helpers
class ListGroupTest < ActionView::TestCase

  test 'list_group with link' do
    actual = list_group(type: :link) do |lg|
      lg.list 'Momo', { state: :success }, { href: '#momo' }
      lg.list({ tap: true, active: true }, { href: '#toto' }) do |l|
        l.header 'My title'
        l.body   'My body'
      end
    end
    expected = nil

    assert_equal actual, expected
  end

  test 'list_group' do
    actual = list_group do |lg|
      lg.list 'Lulu'
      lg.list 'Toto'
    end
    expected = nil

    assert_equal actual, expected
  end

end
