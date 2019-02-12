require 'test_helper'
class ToastTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'toast' do
    actual = ui_toast(auto_hide: true, class: 'my-toast') do |t|
      t.header 'My header toast', glyph: 'eye', time: 'Now', class: 'my-header-toast'
      t.body 'My body toast', class: 'my-body-toast'
    end
    expected = "<div data-autohide=\"true\" class=\"my-toast toast\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\"><div class=\"my-header-toast toast-header\"><strong class=\"mr-auto\">My header toast</strong><button class=\"ml-2 mb-1 close\" data-dismiss=\"toast\" aria-label=\"Close\"><span aria-hidden=\"true\">&amp;times;</span></button></div><div class=\"my-body-toast toast-body\">My body toast</div></div>"

    assert_equal expected, actual
  end

end
