# frozen_string_literal: true

require 'test_helper'
class SpinnerTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'spinner' do
    actual   = ui_spinner
    expected = '<div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div>'

    assert_equal expected, actual
  end

  test 'spinner with status and content' do
    actual   = ui_spinner 'My spinner', status: :secondary
    expected = '<div class="text-secondary spinner-border" role="status"><span class="sr-only">My spinner</span></div>'

    assert_equal expected, actual
  end

  test 'spinner type' do
    actual   = ui_spinner nil, type: :grow
    expected = '<div class="spinner-grow" role="status"><span class="sr-only">Loading...</span></div>'

    assert_equal expected, actual
  end

  test 'spinner in button' do
    actual   = ui_button 'Load', spinner: { status: :danger, type: :grow }
    expected = '<button class="btn-secondary btn"><span class="me-2 text-danger spinner-grow spinner-grow-sm" role="status"><span class="sr-only">Loading...</span></span>Load</button>'

    assert_equal expected, actual
  end
end
