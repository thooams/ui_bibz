# frozen_string_literal: true

require 'test_helper'

class GlyphGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'create glyph group' do
    actual = ui_glyph_group do |gg|
      gg.glyph 'bookmark'
      gg.glyph 'heart', inverse: true, transform: 'shrink-10 up-2'
    end

    expected = '<span class="fa-layers fa-fw"><i class="glyph fas fa-bookmark"></i><i data-fa-transform="shrink-10 up-2" class="glyph fas fa-heart fa-inverse"></i></span>'
    assert_equal expected, actual
  end

  test 'create glyph group with text' do
    actual = ui_glyph_group do |gg|
      gg.glyph 'certificate'
      gg.text 'new', inverse: true, transform: 'shrink-11.5 rotate--30'
    end

    expected = '<span class="fa-layers fa-fw"><i class="glyph fas fa-certificate"></i><span data-fa-transform="shrink-11.5 rotate--30" class="fa-layers-text fa-inverse">new</span></span>'
    assert_equal expected, actual
  end

  test 'create glyph group with counter' do
    actual = ui_glyph_group do |gg|
      gg.glyph 'envelope'
      gg.counter '1419', position: 'top-right'
    end

    expected = '<span class="fa-layers fa-fw"><i class="glyph fas fa-envelope"></i><span class="fa-layers-counter fa-layers-top-right">1419</span></span>'
    assert_equal expected, actual
  end
end
