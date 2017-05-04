require 'test_helper'

class GridTest < ActionView::TestCase

  test 'row' do
    actual = UiBibz::Ui::Core::Layouts::Row.new(class: 'test') do
      'test'
    end.render
    expected = "<div class=\"test row\">test</div>"

    assert_equal expected, actual
  end

  test "col" do
    actual   = UiBibz::Ui::Core::Layouts::Col.new('test', { num: 1, push: 2, offset: 3, pull: 4 }, { class: 'test' }).render
    expected = "<div class=\"test col-md-1 col-md-push-2 offset-md-3 col-md-pull-4\">test</div>"

    assert_equal expected, actual
  end

  test "col with several cols" do
    actual   = UiBibz::Ui::Core::Layouts::Col.new(md: { num: 1, push: 2, pull: 4 }, xl: { num: 6, offset: 5 }, class: 'test') do
      "test"
    end.render
    expected = "<div class=\"test col-md-1 col-md-push-2 col-md-pull-4 col-xl-6 offset-xl-5\">test</div>"

    assert_equal expected, actual
  end

end
