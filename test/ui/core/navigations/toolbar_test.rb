# frozen_string_literal: true

require 'test_helper'
class ToolbarTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Toolbar' do
    actual = ui_toolbar do |t|
      t.button_group do |bg|
        bg.button 'Home'
      end
    end
    expected = '<div class="btn-toolbar" role="toolbar"><div class="btn-group" role="group"><button class="btn-secondary btn">Home</button></div></div>'

    assert_equal expected, actual
  end

  test 'Toolbar justify' do
    actual = ui_toolbar justify: true do |t|
      t.button_group do |bg|
        bg.button 'Home'
      end
      t.spacer 2
      t.button_group do |bg|
        bg.button 'Home 2'
      end
    end
    expected = '<div class="btn-toolbar justify-content-between" role="toolbar"><div role="group" class="btn-group me-2"><button class="btn-secondary btn">Home</button></div><div class="btn-group" role="group"><button class="btn-secondary btn">Home 2</button></div></div>'

    assert_equal expected, actual
  end
end
