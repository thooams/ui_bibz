require 'test_helper'

class RowTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'row' do
    actual = ui_row(class: 'test') do
      'test'
    end
    expected = "<div class=\"test row\">test</div>"

    assert_equal expected, actual
  end

end
