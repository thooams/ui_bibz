require 'test_helper'
include UiBibz::Helpers
class NavTest < ActionView::TestCase

  test 'Nav with tab' do
    actual = UiBibz::Ui::Nav.new().tap do |n|
      n.link 'Home', status: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile'
      n.link 'Messages', url: "#messages", selector: 'messages'
    end.render
    expected = "<ul class=\"nav nav-tabs\"><li class=\"active\" role=\"presentation\"><a aria-controls=\"home\" role=\"tab\" data-toggle=\"tab\" href=\"#Home\">Home</a></li><li role=\"presentation\"><a aria-controls=\"profile\" role=\"tab\" data-toggle=\"tab\" href=\"#profile\">Profile</a></li><li role=\"presentation\"><a aria-controls=\"messages\" role=\"tab\" data-toggle=\"tab\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

  test 'Nav with pills' do
    actual = UiBibz::Ui::Nav.new(type: :pills, position: :justified).tap do |n|
      n.link 'Home', status: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile'
      n.link 'Messages', url: "#messages", selector: 'messages', status: :disabled
    end.render
    expected = "<ul class=\"nav nav-pills nav-justified\"><li class=\"active\" role=\"presentation\"><a aria-controls=\"home\" role=\"tab\" data-toggle=\"tab\" href=\"#Home\">Home</a></li><li role=\"presentation\"><a aria-controls=\"profile\" role=\"tab\" data-toggle=\"tab\" href=\"#profile\">Profile</a></li><li class=\"disabled\" role=\"presentation\"><a aria-controls=\"messages\" role=\"tab\" data-toggle=\"tab\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

end
