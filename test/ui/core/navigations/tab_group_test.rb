require 'test_helper'
class TabGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Tab group' do
    actual = ui_tab_group do |n|
      n.tab 'Home', state: :active, url: "#Home", selector: 'home'
      n.tab 'Profile', url: "#profile", selector: 'profile'
      n.tab 'Messages', url: "#messages", selector: 'messages'
    end
    expected = "<ul class=\"nav nav-tabs\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Type' do
    actual = ui_tab_group type: :links do |n|
      n.tab 'Home', state: :active, url: "#Home", selector: 'home'
      n.tab 'Profile', url: "#profile", selector: 'profile'
      n.tab 'Messages', url: "#messages", selector: 'messages'
    end
    expected = "<nav class=\"nav nav-tabs\"><a class=\"active nav-link\" href=\"#Home\">Home</a><a class=\"nav-link\" href=\"#profile\">Profile</a><a class=\"nav-link\" href=\"#messages\">Messages</a></nav>"

    assert_equal expected, actual
  end

  test 'Position' do
    actual = ui_tab_group(position: :right) do |n|
      n.tab 'Home', state: :active, url: "#Home", selector: 'home'
      n.tab 'Profile', url: "#profile", selector: 'profile', label: 16
      n.tab 'Messages', url: "#messages", selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav nav-tabs justify-content-end\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"disabled nav-link\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Justified' do
    actual = ui_tab_group(justified: true) do |n|
      n.tab 'Home', state: :active, url: "#Home", selector: 'home'
      n.tab 'Profile', url: "#profile", selector: 'profile', label: 16
      n.tab 'Messages', url: "#messages", selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav nav-tabs\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"disabled nav-link\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

end
