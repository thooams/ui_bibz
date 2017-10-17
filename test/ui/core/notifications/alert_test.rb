require 'test_helper'
class AlertTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'alert' do
    actual = ui_alert 'state'
    expected = "<div class=\"alert-info alert alert-dismissible\" role=\"alert\">state</div>"

    assert_equal expected, actual
  end

  test 'alert with more informaton' do
    actual = ui_alert(tap: true) do |a|
      a.header 'Information'
      a.body 'Body text'
    end
    expected = "<div class=\"alert-info alert alert-dismissible\" role=\"alert\"><h4 class=\"alert-header\">Information</h4><hr /><p class=\"alert-body mb-0\">Body text</p></div>"

    assert_equal expected, actual
  end

end
