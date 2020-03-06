# frozen_string_literal: true

require 'test_helper'

class StarTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'stars with 1' do
    actual   = ui_star(1)
    expected = '<span class="stars-notation"><i class="glyph fas fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i></span>'
    assert_equal expected, actual
  end

  test 'stars with 2.1' do
    actual   = ui_star(2.1)
    expected = '<span class="stars-notation"><i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i> <i class="glyph fas fa-star-half-alt"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i></span>'
    assert_equal expected, actual
  end

  test 'stars with 3.6 with status danger' do
    actual   = ui_star(3.6, { status: :danger })
    expected = '<span class="stars-notation"><i class="glyph-danger glyph fas fa-star"></i> <i class="glyph-danger glyph fas fa-star"></i> <i class="glyph-danger glyph fas fa-star"></i> <i class="glyph-danger glyph fas fa-star-half-alt"></i> <i class="glyph-danger glyph far fa-star"></i></span>'
    assert_equal expected, actual
  end

  test 'stars with 4.9' do
    actual   = ui_star(4.9)
    expected = '<span class="stars-notation"><i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i> <i class="glyph fas fa-star-half-alt"></i></span>'
    assert_equal expected, actual
  end

  test 'stars with 5' do
    actual   = ui_star(5)
    expected = '<span class="stars-notation"><i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i></span>'
    assert_equal expected, actual
  end

  test 'stars with number options 11.2' do
    actual   = ui_star(2.5, { num: 11.2 })
    expected = '<span class="stars-notation"><i class="glyph fas fa-star"></i> <i class="glyph fas fa-star"></i> <i class="glyph fas fa-star-half-alt"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i> <i class="glyph far fa-star"></i></span>'
    assert_equal expected, actual
  end
end
