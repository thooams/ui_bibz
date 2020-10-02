# frozen_string_literal: true

require 'test_helper'

class RowTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'row' do
    actual = ui_row(class: 'test') do
      'test'
    end
    expected = '<div class="test row">test</div>'

    assert_equal expected, actual
  end

  test 'row with size' do
    actual = ui_row(num: 2) do
      'test'
    end
    expected = '<div class="row row-cols-md-2">test</div>'

    assert_equal expected, actual
  end

  test 'row with several sizes' do
    actual = ui_row(md: { num: 4 }, xs: { num: 2 }) do
      'test'
    end
    expected = '<div class="row row-cols-md-4 row-cols-xs-2">test</div>'

    assert_equal expected, actual
  end

  test 'row tapped' do
    actual = ui_row(tap: true, class: 'test') do |row|
      row.col do
        'test'
      end
    end
    expected = "<div class=\"test row\"><div class=\"col\">test</div></div>"

    assert_equal expected, actual
  end
end
