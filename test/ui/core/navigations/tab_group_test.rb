# frozen_string_literal: true

require 'test_helper'
class TabGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Tab group' do
    actual = ui_tab_group do |n|
      n.tab 'Home', state: :active, url: '#Home', selector: 'home'
      n.tab 'Profile', url: '#profile', selector: 'profile'
      n.tab 'Messages', url: '#messages', selector: 'messages'
    end
    expected = "<ul class=\"nav nav-tabs\" role=\"tablist\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\" data-toggle=\"tab\" role=\"tab\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\" data-toggle=\"tab\" role=\"tab\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"nav-link\" data-toggle=\"tab\" role=\"tab\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Type' do
    actual = ui_tab_group type: :links do |n|
      n.tab 'Home', state: :active, url: '#Home', selector: 'home'
      n.tab 'Profile', url: '#profile', selector: 'profile'
      n.tab 'Messages', url: '#messages', selector: 'messages'
    end
    expected = "<ul class=\"nav nav-tabs\" role=\"tablist\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\" data-toggle=\"tab\" role=\"tab\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\" data-toggle=\"tab\" role=\"tab\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"nav-link\" data-toggle=\"tab\" role=\"tab\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'tag_type' do
    actual = ui_tab_group tag_type: :span do |n|
      n.tab 'Home', state: :active, url: '#Home', selector: 'home'
      n.tab 'Profile', url: '#profile', selector: 'profile'
      n.tab 'Messages', url: '#messages', selector: 'messages'
    end
    expected = "<ul class=\"nav nav-tabs\" role=\"tablist\"><li class=\"nav-item\"><span class=\"active nav-link\" data-toggle=\"tab\" role=\"tab\">Home</span></li><li class=\"nav-item\"><span class=\"nav-link\" data-toggle=\"tab\" role=\"tab\">Profile</span></li><li class=\"nav-item\"><span class=\"nav-link\" data-toggle=\"tab\" role=\"tab\">Messages</span></li></ul>"

    assert_equal expected, actual
  end

  test 'Position' do
    actual = ui_tab_group(position: :right) do |n|
      n.tab 'Home', state: :active, url: '#Home', selector: 'home'
      n.tab 'Profile', url: '#profile', selector: 'profile', label: 16
      n.tab 'Messages', url: '#messages', selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav nav-tabs justify-content-end\" role=\"tablist\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\" data-toggle=\"tab\" role=\"tab\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\" data-toggle=\"tab\" role=\"tab\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"disabled nav-link\" data-toggle=\"tab\" role=\"tab\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Justified' do
    actual = ui_tab_group(justified: true) do |n|
      n.tab 'Home', state: :active, url: '#Home', selector: 'home'
      n.tab 'Profile', url: '#profile', selector: 'profile', label: 16
      n.tab 'Messages', url: '#messages', selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav nav-tabs\" role=\"tablist\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\" data-toggle=\"tab\" role=\"tab\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\" data-toggle=\"tab\" role=\"tab\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"disabled nav-link\" data-toggle=\"tab\" role=\"tab\">Messages</a></li></ul>"

    assert_equal expected, actual
  end
end
