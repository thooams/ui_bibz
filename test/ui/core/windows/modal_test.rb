# encoding: UTF-8
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
    expected = "<div class=\"modal\"><div class=\"modal-dialog \" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\"><button class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span><span class=\"sr-only\">Close</span></button><h4 class=\"modal-title\">My title</h4></div><div class=\"modal-body\">My body</div><div class=\"modal-footer\"><a class=\"btn-link btn\" href=\"#\">Close</a><a class=\"btn-primary btn\" href=\"#\">Save</a></div></div></div></div>"

    assert_equal expected, actual
  end
end
