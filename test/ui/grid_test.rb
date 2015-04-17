require 'test_helper'
include UiBibz::Helpers
class GridTest < ActionView::TestCase

  test 'row' do
    actual = UiBibz::Ui::Row.new() do
      'test'
    end.render
    expected = "<div class=\"row\">test</div>"

    assert_equal expected, actual
  end

  test 'col with simple arg' do
    actual = UiBibz::Ui::Col.new({ size: :lg, num: 1}) do
      'test'
    end.render
    expected = "<div class=\"col-lg-1\">test</div>"

    assert_equal expected, actual
  end

  test 'col with multiple args' do
    actual = UiBibz::Ui::Col.new([{ size: :lg, num: 1, offset: 2}, { num: 1 }], class: 'test') do
      'test'
    end.render
    expected = "<div class=\"test col-lg-1 col-offset-2 col-md-1\">test</div>"

    assert_equal expected, actual
  end

  test 'grid' do
    actual = UiBibz::Ui::Grid.new().tap do |g|
      g.view position: :left do
        'left'
      end
      g.view 'center', position: :center
      g.view 'right', position: :right
      g.view 'bottom', position: :bottom
    end.render
    expected = "<div class=\"row\"><div class=\"col-md-1\">left</div><div class=\"col-md-10\">center</div><div class=\"col-md-1\">right</div><div class=\"col-md-12\">bottom</div></div>"

    assert_equal expected, actual
  end

end
