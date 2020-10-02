# frozen_string_literal: true

require 'test_helper'

class BreakdownClassNameGeneratorTest < ActionView::TestCase
  test 'name genenator with multiple options' do
    options = {
      xs: { num: 2, pull: 1, push: 1 },
      md: { num: 3 },
      lg: { num: 5 }
    }

    actual   = UiBibz::Utils::BreakdownClassNameGenerator.new(options).class_names
    expected = ["col-xs-2 col-xs-pull-1 col-xs-push-1", "col-md-3", "col-lg-5"]

    assert_equal expected, actual
  end

  test 'name genenator with nothing' do
    actual   = UiBibz::Utils::BreakdownClassNameGenerator.new.class_names
    expected = "col"

    assert_equal expected, actual
  end

  test 'name genenator with num' do
    actual   = UiBibz::Utils::BreakdownClassNameGenerator.new(num: 6).class_names
    expected = ["col-6"]

    assert_equal expected, actual
  end

  test 'name genenator with num and size' do
    actual   = UiBibz::Utils::BreakdownClassNameGenerator.new(lg: { num: 6 }).class_names
    expected = ["col-lg-6"]

    assert_equal expected, actual
  end

  test "name generator with position" do
    actual   = UiBibz::Utils::BreakdownClassNameGenerator.new({ position: :vertical, num: 2 }, 'g').class_names
    expected = ["gy-2"]

    assert_equal expected, actual
  end

  test "name generator with position and size" do
    actual   = UiBibz::Utils::BreakdownClassNameGenerator.new({ xs: { num: 6, position: :horizontal } }, 'g').class_names
    expected = ["gx-xs-6"]

    assert_equal expected, actual
  end
end
