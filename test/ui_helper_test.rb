# encoding: UTF-8
require 'test_helper'

include UiBibz::Helpers::UiCoreHelper
class UiHelperTest < ActionView::TestCase

  test 'breadcrumb' do
    actual = breadcrumb do |b|
      b.link 'Home', url: '#home', glyph: 'home'
      b.link 'Toto', { url: '#toto', status: :active }
    end
    expected = "<ol class=\"breadcrumb\"><li><a href=\"#home\"><i class=\"glyph fa fa-home\"></i> Home</a></li><li class=\"active\"><a href=\"#toto\">Toto</a></li></ol>"

    assert_equal expected, actual
  end

  test 'alert' do
    actual = notify 'toto'
    expected = "<div class=\"alert-info alert alert-dismissible\" role=\"alert\">toto</div>"

    assert_equal expected, actual
  end

  test 'etiquette' do
    actual   = etiquette 'toto', state: :success, glyph: 'pencil'
    expected = "<span class=\"label-success label\"><i class=\"glyph fa fa-pencil\"></i> toto</span>"

    assert_equal expected, actual
  end

  test 'etiquette pill' do
    actual   = etiquette 'toto', state: :success, type: :pill, glyph: 'pencil'
    expected = "<span class=\"label-success label label-pill\"><i class=\"glyph fa fa-pencil\"></i> toto</span>"

    assert_equal expected, actual
  end

  test 'jumbotron with full_width' do
    actual   = jumbotron 'toto', full_width: true
    expected = "<div class=\"jumbotron\">toto</div>"

    assert_equal expected, actual
  end

  test 'jumbotron' do
    actual   = jumbotron 'toto'
    expected = "<div class=\"jumbotron\">toto</div>"

    assert_equal expected, actual
  end

  test 'progress bar' do
    actual   = progress_bar 30
    expected = "<progress class=\"progress\"><div class=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"30\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 30%\">30%</div></progress>"

    assert_equal expected, actual
  end

  test 'navbar' do
    actual = navbar(title: 'My title', position: :bottom, type: :inverse, glyph: 'pencil') do |nb|
      nb.nav do |n|
        n.link 'Toto', url: '#'
        n.link 'Tata', url: '#'
      end
      nb.nav(position: :right) do |n|
        n.link 'lala', url: '#'
        n.link 'lolo', url: '#'
      end
    end
    expected = "<nav class=\"navbar navbar-inverse navbar-fixed-bottom\"><div class=\"container-fluid\"><div class=\"navbar-header\"><button class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar-collapse-57604740876218660627112051613797907862\"><span class=\"sr-only\">Toggle navigation</span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button><a class=\"navbar-brand\" href=\"#\"><i class=\"glyph fa fa-pencil\"></i> My title</a></div><div class=\"collapse navbar-collapse\" id=\"navbar-collapse-57604740876218660627112051613797907862\"><ul class=\"nav navbar-nav\"><li role=\"presentation\"><a href=\"#\">Toto</a></li><li role=\"presentation\"><a href=\"#\">Tata</a></li></ul><ul class=\"nav navbar-nav nav-right\"><li role=\"presentation\"><a href=\"#\">lala</a></li><li role=\"presentation\"><a href=\"#\">lolo</a></li></ul></div></div></nav>"

    refute_equal expected, actual
  end

  test 'progress bar with several bars' do
    actual = progress_bar(tap: true) do |pb|
      pb.bar 20, type: :animated
      pb.bar 30, state: :success
      pb.bar 10, type: :striped
    end
    expected = "<progress class=\"progress\"><div class=\"progress-bar progress-bar-striped active\" role=\"progressbar\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 20%\">20%</div><div class=\"progress-bar-success progress-bar\" role=\"progressbar\" aria-valuenow=\"30\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 30%\">30%</div><div class=\"progress-bar progress-bar-striped\" role=\"progressbar\" aria-valuenow=\"10\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 10%\">10%</div></progress>"

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
        concat button_link 'Close', url: '#', state: :link
        concat button_link 'Save', url: '#', state: :primary
      end
    end
    expected = "<div class=\"modal\"><div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\"><button class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span><span class=\"sr-only\">Close</span></button><h4 class=\"modal-title\">My title</h4></div><div class=\"modal-body\">My body</div><div class=\"modal-footer\"><a class=\"btn-link btn\" href=\"#\">Close</a><a class=\"btn-primary btn\" href=\"#\">Save</a></div></div></div></div>"

    assert_equal expected, actual
  end

  test 'textfield without prepend and append' do
    actual = textfield 'test'
    expected = "<input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" />"

    assert_equal expected, actual
  end

  test 'textfield with prepend and append' do
    actual = textfield 'test', append: '1', prepend: '2'
    expected = "<div class=\"input-group\"><span class=\"input-group-addon\">1</span><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" /><span class=\"input-group-addon\">2</span></div>"

    assert_equal expected, actual
  end

  test 'textfield size' do
    actual = textfield 'test', size: :xs, append: '1', prepend: '2'
    expected = "<div class=\"input-group input-group-xs\"><span class=\"input-group-addon\">1</span><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" /><span class=\"input-group-addon\">2</span></div>"

    assert_equal expected, actual
  end

end
