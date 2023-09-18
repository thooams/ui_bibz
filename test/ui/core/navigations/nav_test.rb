# frozen_string_literal: true

require 'test_helper'
class NavTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Nav with tab' do
    actual = ui_nav(type: :tabs) do |n|
      n.link 'Home', state: :active, url: '#Home', selector: 'home'
      n.link 'Profile', url: '#profile', selector: 'profile'
      n.link 'Messages', url: '#messages', selector: 'messages'
    end
    expected = "<ul class=\"nav nav-tabs\" role=\"tablist\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\" data-bs-toggle=\"tab\" role=\"tab\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\" data-bs-toggle=\"tab\" role=\"tab\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"nav-link\" data-bs-toggle=\"tab\" role=\"tab\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Nav with pills' do
    actual = ui_nav(type: :pills) do |n|
      n.link 'Home', state: :active, url: '#Home', selector: 'home'
      n.link 'Profile', url: '#profile', selector: 'profile', label: 16
      n.link 'Messages', url: '#messages', selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav nav-pills\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"disabled nav-link\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Position' do
    actual = ui_nav(position: :right) do |n|
      n.link 'Home', state: :active, url: '#Home', selector: 'home'
      n.link 'Profile', url: '#profile', selector: 'profile', label: 16
      n.link 'Messages', url: '#messages', selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav justify-content-end\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"disabled nav-link\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Justified' do
    actual = ui_nav(justified: true) do |n|
      n.link 'Home', state: :active, url: '#Home', selector: 'home'
      n.link 'Profile', url: '#profile', selector: 'profile', label: 16
      n.link 'Messages', url: '#messages', selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"disabled nav-link\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'stacked' do
    actual = ui_nav(stacked: true) do |n|
      n.link 'Home', state: :active, url: '#Home', selector: 'home'
      n.link 'Profile', url: '#profile', selector: 'profile', label: 16
      n.link 'Messages', url: '#messages', selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav flex-column\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"disabled nav-link\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'list' do
    actual = ui_nav(type: :list) do |n|
      n.link 'Home', state: :active, url: '#Home', selector: 'home'
      n.link 'Profile', url: '#profile', selector: 'profile', label: 16
      n.link 'Messages', url: '#messages', selector: 'messages', state: :disabled
    end
    expected = "<div class=\"list-group\" role=\"tablist\"><a href=\"#Home\" class=\"active list-group-item list-group-item-action\" data-bs-toggle=\"tab\" role=\"tab\" aria-controls=\"home\">Home</a><a href=\"#profile\" class=\"list-group-item list-group-item-action\" data-bs-toggle=\"tab\" role=\"tab\" aria-controls=\"profile\">Profile</a><a href=\"#messages\" class=\"disabled list-group-item list-group-item-action\" data-bs-toggle=\"tab\" role=\"tab\" aria-controls=\"messages\">Messages</a></div>"

    assert_equal expected, actual
  end

  test 'underline' do
    actual = ui_nav(underline: true) do |n|
      n.link 'Home', state: :active, url: '#Home', selector: 'home'
      n.link 'Profile', url: '#profile', selector: 'profile', label: 16
      n.link 'Messages', url: '#messages', selector: 'messages', state: :disabled
    end
    expected = "<ul class=\"nav nav-underline\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"disabled nav-link\">Messages</a></li></ul>"

    assert_equal expected, actual
  end
end
