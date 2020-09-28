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

  test 'row form' do
    actual = ui_row(type: :form) do
      'test'
    end
    expected = '<div class="form-row">test</div>'

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
