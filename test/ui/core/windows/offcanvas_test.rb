# frozen_string_literal: true

require 'test_helper'

class UiHelperTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'offcanvas' do
    actual = ui_offcanvas position: :top do |m|
      m.header 'My title'
      m.body 'My body'
    end
    expected = "<div class=\"offcanvas offcanvas-top\" tabindex=\"-1\"><div class=\"offcanvas-header\"><h5 class=\"offcanvas-title\">My title</h5><button class=\"btn-close\" data-bs-dismiss=\"offcanvas\" aria-label=\"Close\"></button></div><div class=\"offcanvas-body\">My body</div></div>"

    assert_equal expected, actual
  end

  test 'offcanvas options' do
    actual = ui_offcanvas scrollable: true, backdrop: :static do |m|
      m.header 'My title'
      m.body 'My body'
    end
    expected = "<div data-bs-backdrop=\"static\" data-bs-scroll=\"true\" class=\"offcanvas offcanvas-start\" tabindex=\"-1\"><div class=\"offcanvas-header\"><h5 class=\"offcanvas-title\">My title</h5><button class=\"btn-close\" data-bs-dismiss=\"offcanvas\" aria-label=\"Close\"></button></div><div class=\"offcanvas-body\">My body</div></div>"

    assert_equal expected, actual
  end
end
