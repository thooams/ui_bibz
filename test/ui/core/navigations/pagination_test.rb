require 'test_helper'
class PaginationTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Pagination' do
    actual = ui_pagination do |p|
      p.link 'Home', state: :active, url: "#Home", selector: 'home'
      p.link 'Profile', url: "#profile", selector: 'profile'
      p.link 'Messages', url: "#messages", selector: 'messages'
    end
    expected = "<nav><ul class=\"pagination\"><li class=\"active page-item\"><a class=\"page-link\" href=\"#Home\">Home</a></li><li class=\"page-item\"><a class=\"page-link\" href=\"#profile\">Profile</a></li><li class=\"page-item\"><a class=\"page-link\" href=\"#messages\">Messages</a></li></ul></nav>"

    assert_equal expected, actual
  end

  test 'Pagination size' do
    actual = ui_pagination size: :lg do |p|
      p.link 'Home', state: :active, url: "#Home", selector: 'home'
      p.link 'Profile', url: "#profile", selector: 'profile'
      p.link 'Messages', url: "#messages", selector: 'messages'
    end
    expected = "<nav><ul class=\"pagination pagination-lg\"><li class=\"active page-item\"><a class=\"page-link\" href=\"#Home\">Home</a></li><li class=\"page-item\"><a class=\"page-link\" href=\"#profile\">Profile</a></li><li class=\"page-item\"><a class=\"page-link\" href=\"#messages\">Messages</a></li></ul></nav>"

    assert_equal expected, actual
  end

  test 'Pagination position' do
    actual = ui_pagination position: :right do |p|
      p.link 'Home', state: :active, url: "#Home", selector: 'home'
      p.link 'Profile', url: "#profile", selector: 'profile'
      p.link 'Messages', url: "#messages", selector: 'messages'
    end
    expected = "<nav><ul class=\"pagination justify-content-end\"><li class=\"active page-item\"><a class=\"page-link\" href=\"#Home\">Home</a></li><li class=\"page-item\"><a class=\"page-link\" href=\"#profile\">Profile</a></li><li class=\"page-item\"><a class=\"page-link\" href=\"#messages\">Messages</a></li></ul></nav>"

    assert_equal expected, actual
  end

end
