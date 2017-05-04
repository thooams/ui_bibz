# encoding: UTF-8
require 'test_helper'

class UiHelperTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'breadcrumb' do
    actual = ui_breadcrumb(tap: true) do |b|
      b.link 'Home', url: '#home', glyph: 'home'
      b.link 'state', { url: '#state', state: :active }
    end
    expected = "<ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"#home\"><i class=\"glyph fa fa-home\"></i> Home</a></li><li class=\"active breadcrumb-item\"><a href=\"#state\">state</a></li></ol>"

    assert_equal expected, actual
  end

  test 'breadcrumb with store' do
    users    = create_list(:user, 3)
    actual   = ui_breadcrumb store: users, link_label: :name_fr, link_url: user_path(:id)
    expected = "<ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"/users/1/\">Name fr</a></li><li class=\"breadcrumb-item\"><a href=\"/users/2/\">Name fr</a></li><li class=\"breadcrumb-item\">Name fr</li></ol>"

    assert_equal expected, actual
  end

  test 'alert' do
    actual = ui_alert 'state'
    expected = "<div class=\"alert-info alert alert-dismissible\" role=\"alert\">state</div>"

    assert_equal expected, actual
  end

  test 'badge' do
    actual   = ui_badge 'state', status: :success, glyph: 'pencil'
    expected = "<span class=\"tag-success tag\"><i class=\"glyph fa fa-pencil\"></i> state</span>"

    assert_equal expected, actual
  end

  test 'badge pill' do
    actual   = ui_badge 'state', status: :success, type: :pill, glyph: 'pencil'
    expected = "<span class=\"tag-success tag tag-pill\"><i class=\"glyph fa fa-pencil\"></i> state</span>"

    assert_equal expected, actual
  end

  test 'jumbotron with full_width' do
    actual   = ui_jumbotron 'state', full_width: true
    expected = "<div class=\"jumbotron\">state</div>"

    assert_equal expected, actual
  end

  test 'jumbotron' do
    actual   = ui_jumbotron 'state'
    expected = "<div class=\"jumbotron\">state</div>"

    assert_equal expected, actual
  end

  test 'navbar' do
    actual = ui_navbar(title: 'My title', position: :bottom, type: :inverse, glyph: 'pencil') do |nb|
      nb.nav do |n|
        n.link 'state', url: '#'
        n.link 'Tata', url: '#'
      end
      nb.nav(position: :right) do |n|
        n.link 'lala', url: '#'
        n.link 'lolo', url: '#'
      end
      nb.form '/search', { type: :form_tag, position: :right } do
        concat ui_text_field 'search'
        concat ui_button :submit
      end
    end
    expected = "<nav class=\"navbar navbar-inverse navbar-fixed-bottom\"><div class=\"container-fluid\"><div class=\"navbar-header\"><button class=\"navbar-toggler hidden-sm-up\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbar-collapse-243510900091050741589988795055654058002\">☰</button></div><div class=\"collapse navbar-toggleable-xs\" id=\"navbar-collapse-243510900091050741589988795055654058002\"><a class=\"navbar-brand\" href=\"/\">My title</a><ul class=\"nav navbar-nav\"><li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">state</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">Tata</a></li></ul><ul class=\"nav navbar-nav pull-right\"><li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">lala</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">lolo</a></li></ul><form class=\"navbar-form form-inline pull-right\" action=\"/search\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"text\" name=\"search\" id=\"search\" /><button class=\"btn-primary btn\">submit</button><input type=\"text\" name=\"search\" id=\"search\" /><button class=\"btn-primary btn\">submit</button></form>
+</div></div></nav>"

    refute_equal expected, actual
  end

  test 'progress bar' do
    actual = ui_progress(20)
    expected = "<progress class=\"progress\" max=\"100\" value=\"20\">20</progress>"

    assert_equal expected, actual
  end

  test 'contaner' do
    actual   = ui_container type: :fluid
    expected = "<div class=\"container-fluid\"></div>"

    assert_equal expected, actual
  end

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
