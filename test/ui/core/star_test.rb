require 'test_helper'

class StarTest < ActionView::TestCase

    test "stars with 1" do
      actual   = UiBibz::Ui::Core::Star.new(1).render
      expected = "<span class=\"stars-notation\"><i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i></span>"
      assert_equal expected, actual
    end

    test "stars with 2.1" do
      actual   = UiBibz::Ui::Core::Star.new(2.1).render
      expected = "<span class=\"stars-notation\"><i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star-half-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i></span>"
      assert_equal expected, actual
    end

    test "stars with 3.6 with status danger" do
      actual   = UiBibz::Ui::Core::Star.new(3.6, { status: :danger }).render
      expected = "<span class=\"stars-notation\"><i class=\"glyph-danger glyph fa fa-star\"></i> <i class=\"glyph-danger glyph fa fa-star\"></i> <i class=\"glyph-danger glyph fa fa-star\"></i> <i class=\"glyph-danger glyph fa fa-star-half-o\"></i> <i class=\"glyph-danger glyph fa fa-star-o\"></i></span>"
      assert_equal expected, actual
    end

    test "stars with 4.9" do
      actual   = UiBibz::Ui::Core::Star.new(4.9).render
      expected = "<span class=\"stars-notation\"><i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star-half-o\"></i></span>"
      assert_equal expected, actual
    end

    test "stars with 5" do
      actual   = UiBibz::Ui::Core::Star.new(5).render
      expected = "<span class=\"stars-notation\"><i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i></span>"
      assert_equal expected, actual
    end

    test "stars with number options 11.2" do
      actual   = UiBibz::Ui::Core::Star.new(2.5, { num: 11.2 }).render
      expected = "<span class=\"stars-notation\"><i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star\"></i> <i class=\"glyph fa fa-star-half-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i> <i class=\"glyph fa fa-star-o\"></i></span>"
      assert_equal expected, actual
    end

end
