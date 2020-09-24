# frozen_string_literal: true

require 'test_helper'

class JumbotronTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'jumbotron with full_width' do
    actual   = ui_jumbotron 'state', full_width: true
    expected = '<div class="jumbotron bg-light rounded p-4">state</div>'

    assert_equal expected, actual
  end

  test 'jumbotron' do
    actual   = ui_jumbotron 'state'
    expected = '<div class="jumbotron bg-light rounded p-4">state</div>'

    assert_equal expected, actual
  end
end
