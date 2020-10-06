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
    expected = '<div class="row row-cols-2">test</div>'

    assert_equal expected, actual
  end

  test 'row with integer in parameter' do
    actual = ui_row 2 do
      'test'
    end
    expected = '<div class="row row-cols-2">test</div>'

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

  test 'row with col' do
    actual = ui_row do
      ui_col do
        "Test"
      end
    end
    expected = "<div class=\"row\"><div class=\"col\">Test</div></div>"

    assert_equal expected, actual
  end

  test 'row with gutters' do
    actual = ui_row(gutters: 6)
    expected = "<div class=\"row g-6\"></div>"

    assert_equal expected, actual
  end

  test 'row with complex gutters' do
    actual = ui_row(gutters: { md: { num: 6 }, xs: { num: 3, position: :horizontal } })
    expected = "<div class=\"row g-md-6 gx-xs-3\"></div>"

    assert_equal expected, actual
  end

  test "toto" do
    actual = ui_row do |row|
      row.col do
        'Test'
      end
    end
    expected = "<div class=\"row\"><div class=\"col\">Test</div></div>"

    assert_equal expected, actual
  end
end
