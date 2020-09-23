# frozen_string_literal: true

require 'test_helper'

class ColNameGeneratorTest < ActionView::TestCase
  test 'name genenator with multiple options' do
    options = {
      xs: { num: 2, pull: 1, push: 1 },
      md: { num: 3 },
      lg: { num: 5 }
    }

    actual   = UiBibz::Utils::ColNameGenerator.new(options).class_names
    expected = ["col-xs-2 col-xs-pull-1 col-xs-push-1", "col-md-3", "col-lg-5"]

    assert_equal expected, actual
  end

  test 'name genenator with nothing' do
    actual   = UiBibz::Utils::ColNameGenerator.new.class_names
    expected = "col"

    assert_equal expected, actual
  end

  test 'name genenator with num' do
    actual   = UiBibz::Utils::ColNameGenerator.new(num: 6).class_names
    expected = ["col-md-6"]

    assert_equal expected, actual
  end
end
