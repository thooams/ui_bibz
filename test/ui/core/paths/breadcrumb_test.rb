require 'test_helper'

class BreadcrumbTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'breadcrumb' do
    actual = ui_breadcrumb do |b|
      b.link 'Home', url: '#home', glyph: 'home'
      b.link 'state', { url: '#state', state: :active }
    end
    expected = "<ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"#home\"><i class=\"glyph fa fa-home\"></i> Home</a></li><li class=\"active breadcrumb-item\"><a href=\"#state\">state</a></li></ol>"

    assert_equal expected, actual
  end

  #test 'breadcrumb with nav' do
    #actual = UiBibz::Ui::Core::Paths::Breadcrumb.new(type: :nav).tap do |b|
      #b.link 'Home', url: '#home', glyph: 'home'
      #b.link 'state', { url: '#state', state: :active }
    #end.render
    #expected = ""

    #assert_equal expected, actual
  #end

  test 'breadcrumb with store' do
    users    = create_list(:user, 3)
    actual   = ui_breadcrumb(store: users, link_label: :name_fr, link_url: user_path(:id))
    expected = "<ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"/users/1/\">Name fr</a></li><li class=\"breadcrumb-item\"><a href=\"/users/2/\">Name fr</a></li><li class=\"breadcrumb-item\">Name fr</li></ol>"

    assert_equal expected, actual
  end



end

