# encoding: UTF-8
require 'test_helper'

include UiBibz::Helpers::UiCoreHelper
class UiHelperTest < ActionView::TestCase

  test 'breadcrumb' do
    actual = breadcrumb(tap: true) do |b|
      b.link 'Home', url: '#home', glyph: 'home'
      b.link 'state', { url: '#state', state: :active }
    end
    expected = "<ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"#home\"><i class=\"glyph fa fa-home\"></i> Home</a></li><li class=\"active breadcrumb-item\"><a href=\"#state\">state</a></li></ol>"

    assert_equal expected, actual
  end

  test 'breadcrumb with store' do
    users    = create_list(:user, 3)
    actual   = breadcrumb store: users, link_label: :name_fr, link_url: user_path(:id)
    expected = "<ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"/users/1/\">Name fr</a></li><li class=\"breadcrumb-item\"><a href=\"/users/2/\">Name fr</a></li><li class=\"breadcrumb-item\">Name fr</li></ol>"

    assert_equal expected, actual
  end

  test 'alert' do
    actual = notify 'state'
    expected = "<div class=\"alert-info alert alert-dismissible\" role=\"alert\">state</div>"

    assert_equal expected, actual
  end

  test 'etiquette' do
    actual   = etiquette 'state', status: :success, glyph: 'pencil'
    expected = "<span class=\"tag-success tag\"><i class=\"glyph fa fa-pencil\"></i> state</span>"

    assert_equal expected, actual
  end

  test 'etiquette pill' do
    actual   = etiquette 'state', status: :success, type: :pill, glyph: 'pencil'
    expected = "<span class=\"tag-success tag tag-pill\"><i class=\"glyph fa fa-pencil\"></i> state</span>"

    assert_equal expected, actual
  end

  test 'jumbotron with full_width' do
    actual   = jumbotron 'state', full_width: true
    expected = "<div class=\"jumbotron\">state</div>"

    assert_equal expected, actual
  end

  test 'jumbotron' do
    actual   = jumbotron 'state'
    expected = "<div class=\"jumbotron\">state</div>"

    assert_equal expected, actual
  end

  test 'navbar' do
    actual = navbar(title: 'My title', position: :bottom, type: :inverse, glyph: 'pencil') do |nb|
      nb.nav do |n|
        n.link 'state', url: '#'
        n.link 'Tata', url: '#'
      end
      nb.nav(position: :right) do |n|
        n.link 'lala', url: '#'
        n.link 'lolo', url: '#'
      end
    end
    expected = "<nav class=\"navbar navbar-inverse navbar-fixed-bottom\"><div class=\"container-fluid\"><div class=\"navbar-header\"><button class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar-collapse-57604740876218660627112051613797907862\"><span class=\"sr-only\">Toggle navigation</span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button><a class=\"navbar-brand\" href=\"#\"><i class=\"glyph fa fa-pencil\"></i> My title</a></div><div class=\"collapse navbar-collapse\" id=\"navbar-collapse-57604740876218660627112051613797907862\"><ul class=\"nav navbar-nav\"><li role=\"presentation\"><a href=\"#\">state</a></li><li role=\"presentation\"><a href=\"#\">Tata</a></li></ul><ul class=\"nav navbar-nav nav-right\"><li role=\"presentation\"><a href=\"#\">lala</a></li><li role=\"presentation\"><a href=\"#\">lolo</a></li></ul></div></div></nav>"

    refute_equal expected, actual
  end

  test 'progress bar' do
    actual = progress(20)
    expected = "<progress class=\"progress\" max=\"100\" value=\"20\">20</progress>"

    assert_equal expected, actual
  end

  test 'contaner' do
    actual   = container type: :fluid
    expected = "<div class=\"container-fluid\"></div>"

    assert_equal expected, actual
  end

  test 'modal' do
    actual = modal do |m|
      m.header 'My title'
      m.body 'My body'
      m.footer do
        concat button_link 'Close', url: '#', status: :link
        concat button_link 'Save', url: '#', status: :primary
      end
    end
    expected = "<div class=\"modal\"><div class=\"modal-dialog \" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\"><button class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span><span class=\"sr-only\">Close</span></button><h4 class=\"modal-title\">My title</h4></div><div class=\"modal-body\">My body</div><div class=\"modal-footer\"><a class=\"btn-link btn\" href=\"#\">Close</a><a class=\"btn-primary btn\" href=\"#\">Save</a></div></div></div></div>"

    assert_equal expected, actual
  end

end
