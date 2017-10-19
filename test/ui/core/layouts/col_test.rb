require 'test_helper'

class ColTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test "col" do
    actual   = ui_col('test', { num: 1, push: 2, offset: 3, pull: 4 }, { class: 'test' })
    expected = "<div class=\"test col-md-1 col-md-push-2 offset-md-3 col-md-pull-4\">test</div>"

    assert_equal expected, actual
  end

  test "col with several cols" do
    actual   = ui_col(md: { num: 1, push: 2, pull: 4 }, xl: { num: 6, offset: 5 }, class: 'test') do
      "test"
    end
    expected = "<div class=\"test col-md-1 col-md-push-2 col-md-pull-4 col-xl-6 offset-xl-5\">test</div>"

    assert_equal expected, actual
  end

end
