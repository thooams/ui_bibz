# frozen_string_literal: true

require 'test_helper'
class AlertTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'alert' do
    actual = ui_alert 'state'
    expected = '<div class="alert-info alert alert-dismissible" role="alert">state</div>'

    assert_equal expected, actual
  end

  test 'alert with more informaton' do
    actual = ui_alert(status: :success, glyph: 'thumbs-o-up', closable: true) do |a|
      a.header 'Information'
      a.body 'Body text'
    end
    expected = "<div class=\"alert-success alert alert-dismissible\" role=\"alert\"><h4 class=\"alert-header\"><i class=\"glyph fas fa-thumbs-o-up\"></i> Information<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></h4><hr /><p class=\"alert-body mb-0\">Body text</p></div>"

    assert_equal expected, actual
  end

  test 'alert with timeout' do
    actual = ui_alert 'timeout', timeout: 500
    expected = '<div data-timeout="500" class="alert-info alert alert-dismissible" role="alert">timeout</div>'

    assert_equal expected, actual
  end
end
