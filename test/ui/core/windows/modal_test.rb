# frozen_string_literal: true

require 'test_helper'

class UiHelperTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'modal' do
    actual = ui_modal do |m|
      m.header 'My title'
      m.body 'My body'
      m.footer do
        concat ui_button_link 'Close', url: '#', status: :link
        concat ui_button_link 'Save', url: '#', status: :primary
      end
    end
    expected = "<div class=\"modal\" tabindex=\"-1\" aria-labelledby=\"My title\" aria-hidden=\"true\"><div class=\"modal-dialog\"><div class=\"modal-content\"><div class=\"modal-header\"><h5 class=\"modal-title\">My title</h5><button class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button></div><div class=\"modal-body\">My body</div><div class=\"modal-footer\"><a class=\"btn-link btn\" role=\"button\" href=\"#\">Close</a><a class=\"btn-primary btn\" role=\"button\" href=\"#\">Save</a></div></div></div></div>"

    assert_equal expected, actual
  end

  test 'modal with options' do
    actual = ui_modal scrollable: true, fullscreen: true, backdrop: :static do |m|
      m.header 'My title'
      m.body 'My body'
      m.footer do
        concat ui_button_link 'Close', url: '#', status: :link
        concat ui_button_link 'Save', url: '#', status: :primary
      end
    end
    expected = "<div data-backdrop=\"static\" data-keyboard=\"false\" class=\"modal\" tabindex=\"-1\" aria-labelledby=\"My title\" aria-hidden=\"true\"><div class=\"modal-dialog modal-fullscreen modal-dialog-scrollable\"><div class=\"modal-content\"><div class=\"modal-header\"><h5 class=\"modal-title\">My title</h5><button class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button></div><div class=\"modal-body\">My body</div><div class=\"modal-footer\"><a class=\"btn-link btn\" role=\"button\" href=\"#\">Close</a><a class=\"btn-primary btn\" role=\"button\" href=\"#\">Save</a></div></div></div></div>"

    assert_equal expected, actual
  end
end
