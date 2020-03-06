# frozen_string_literal: true

require 'test_helper'
class BadgeTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'badge' do
    actual   = ui_badge 'state', status: :success, glyph: 'pencil'
    expected = '<span class="badge-success badge"><i class="glyph fas fa-pencil"></i>  state</span>'

    assert_equal expected, actual
  end

  test 'badge with url' do
    actual   = ui_badge 'state', url: 'http://example.com'
    expected = '<a class="badge-default badge" href="http://example.com">state</a>'

    assert_equal expected, actual
  end

  test 'badge pill' do
    actual   = ui_badge 'state', status: :success, type: :pill, glyph: 'pencil'
    expected = '<span class="badge-success badge badge-pill"><i class="glyph fas fa-pencil"></i>  state</span>'

    assert_equal expected, actual
  end
end
