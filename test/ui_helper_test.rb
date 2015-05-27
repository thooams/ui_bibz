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
    expected = "<div class=\"alert-info alert\" role=\"alert\">toto</div>"

    assert_equal expected, actual
  end

  test 'etiquette' do
    actual   = etiquette 'toto', state: :success, glyph: 'pencil'
    expected = "<span class=\"label-success label\"><i class=\"glyph fa fa-pencil\"></i> toto</span>"

    assert_equal expected, actual
  end

  test 'jumbotron with full_width' do
    actual   = jumbotron 'toto', full_width: true
    expected = "<div class=\"jumbotron\"><div class=\"container\">toto</div></div>"

    assert_equal expected, actual
  end

  test 'jumbotron' do
    actual   = jumbotron 'toto'
    expected = "<div class=\"jumbotron\">toto</div>"

    assert_equal expected, actual
  end

  test 'progress bar' do
    actual   = progress_bar 30
    expected = "<div class=\"progress\"><div class=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"30\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 30%\">30%</div></div>"

    assert_equal expected, actual
  end

  test 'navbar' do
    nave = nav(class: 'navbar-nav', type: 'navbar') do |n|
      n.link 'Toto', url: '#'
      n.link 'Tata', url: '#'
    end

    actual = navbar(title: 'toto') do |nb|
      nb.item nave
      nb.item 'toto'
    end
    expected = ""

    assert_equal expected, actual
  end

  test 'progress bar with several bars' do
    actual = progress_bar(tap: true) do |pb|
      pb.bar 20, type: :animated
      pb.bar 30, state: :success
      pb.bar 10, type: :striped
    end
    expected = "<div class=\"progress\"><div class=\"progress-bar progress-bar-striped active\" role=\"progressbar\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 20%\">20%</div><div class=\"progress-bar-success progress-bar\" role=\"progressbar\" aria-valuenow=\"30\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 30%\">30%</div><div class=\"progress-bar progress-bar-striped\" role=\"progressbar\" aria-valuenow=\"10\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 10%\">10%</div></div>"

    assert_equal expected, actual
  end

end
