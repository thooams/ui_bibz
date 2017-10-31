require 'test_helper'
class NavTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Nav with tab' do
    actual = ui_nav(type: :tabs) do |n|
      n.link 'Home', state: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile'
      n.link 'Messages', url: "#messages", selector: 'messages'
    end
    expected = "<ul class=\"nav nav-tabs\"><li class=\"nav-item\"><a class=\"active nav-link\" data-toggle=\"tab\" role=\"tab\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" data-toggle=\"tab\" role=\"tab\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"nav-link\" data-toggle=\"tab\" role=\"tab\" href=\"#messages\">Messages</a></li></ul>"
    assert_equal expected, actual
  end

  test 'Nav with pills' do
    actual = ui_nav(type: :pills) do |n|
      n.link 'Home', state: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile', label: 16
      n.link 'Messages', url: "#messages", selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav nav-pills\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"disabled nav-link\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Position' do
    actual = ui_nav(position: :right) do |n|
      n.link 'Home', state: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile', label: 16
      n.link 'Messages', url: "#messages", selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav justify-content-end\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"disabled nav-link\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Justified' do
    actual = ui_nav(justified: true) do |n|
      n.link 'Home', state: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile', label: 16
      n.link 'Messages', url: "#messages", selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"disabled nav-link\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'stacked' do
    actual = ui_nav(stacked: true) do |n|
      n.link 'Home', state: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile', label: 16
      n.link 'Messages', url: "#messages", selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav flex-column\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"disabled nav-link\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

end
