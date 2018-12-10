require 'test_helper'
class DropdownTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Dropdown' do
    actual = UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new("Dropdown").tap do |d|
      d.link 'link'
    end
    expected = "<div class=\"dropdown\"><button class=\"btn btn-secondary dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" id=\"#{ actual.id }\">Dropdown</button><div class=\"dropdown-menu\" arial-labelledby=\"#{ actual.id }\"><a class=\"dropdown-item\" href=\"#\">link</a></div></div>"

    assert_equal expected, actual.render
  end

  test 'Dropdown status' do
    actual = UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new("Dropdown", status: :primary).tap do |d|
      d.link 'link'
    end
    expected = "<div class=\"dropdown\"><button class=\"btn btn-primary dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" id=\"#{ actual.id }\">Dropdown</button><div class=\"dropdown-menu\" arial-labelledby=\"#{ actual.id }\"><a class=\"dropdown-item\" href=\"#\">link</a></div></div>"

    assert_equal expected, actual.render
  end

  test 'Dropdown outline' do
    actual = UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new("Dropdown", status: :primary, outline: true).tap do |d|
      d.link 'link'
    end
    expected = "<div class=\"dropdown\"><button class=\"btn btn-outline-primary dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" id=\"#{ actual.id }\">Dropdown</button><div class=\"dropdown-menu\" arial-labelledby=\"#{ actual.id }\"><a class=\"dropdown-item\" href=\"#\">link</a></div></div>"

    assert_equal expected, actual.render
  end

  test 'Dropdown options' do
    actual =  UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new("Dropdown", type: :dropup, status: :success, glyph: 'diamond').tap do |d|
      d.link 'Link 1', url: '#link1', glyph: 'eye'
      d.header 'header'
      d.link 'Link 2', url: '#link2'
      d.divider
      d.link 'Link3', url: '#link3'
    end
    expected = "<div class=\"dropup\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" id=\"#{ actual.id }\"><i class=\"glyph fas fa-diamond\"></i>  Dropdown</button><div class=\"dropdown-menu\" arial-labelledby=\"#{ actual.id }\"><a class=\"dropdown-item\" href=\"#link1\"><i class=\"glyph fas fa-eye\"></i>  Link 1</a><h6 class=\"dropdown-header\" role=\"presentation\">header</h6><a class=\"dropdown-item\" href=\"#link2\">Link 2</a><div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"#link3\">Link3</a></div></div>"

    assert_equal expected, actual.render
  end

  test 'Split Dropdown' do
    actual = UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new("Split Dropdown").tap do |d|
      d.link 'state'
    end
    expected = "<div class=\"dropdown\"><button class=\"btn btn-secondary dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" id=\"#{ actual.id }\">Split Dropdown</button><div class=\"dropdown-menu\" arial-labelledby=\"#{ actual.id }\"><a class=\"dropdown-item\" href=\"#\">state</a></div></div>"

    assert_equal expected, actual.render
  end

end
