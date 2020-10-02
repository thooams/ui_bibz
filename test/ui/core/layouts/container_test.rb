# frozen_string_literal: true

require 'test_helper'

class UiHelperTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'fluid container' do
    actual   = ui_container type: :fluid
    expected = '<div class="container-fluid"></div>'

    assert_equal expected, actual
  end

  test 'normal container' do
    actual   = ui_container
    expected = '<div class="container"></div>'

    assert_equal expected, actual
  end

  test 'sized container' do
    actual   = ui_container size: :xl
    expected = '<div class="container-xl"></div>'

    assert_equal expected, actual
  end
end
