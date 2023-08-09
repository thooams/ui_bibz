# frozen_string_literal: true

require 'test_helper'
class SplitDropdownTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Split Dropdown' do
    actual = UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new('Split Dropdown').tap do |d|
      d.link 'state'
    end
    expected = "<div class=\"dropdown\"><button class=\"btn btn-secondary dropdown-toggle\" type=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\" id=\"#{actual.id}\">Split Dropdown</button><div class=\"dropdown-menu\" arial-labelledby=\"#{actual.id}\"><a class=\"dropdown-item\" href=\"#\">state</a></div></div>"

    assert_equal expected, actual.render
  end

  test 'Split Dropdown with link' do
    actual = UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new('Split Dropdown', tag: :a, url: "#test").tap do |d|
      d.link 'state'
    end
    expected = "<div class=\"dropdown\"><a class=\"btn btn-secondary dropdown-toggle\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\" id=\"#{actual.id}\">Split Dropdown</a><div class=\"dropdown-menu\" arial-labelledby=\"#{actual.id}\"><a class=\"dropdown-item\" href=\"#\">state</a></div></div>"

    assert_equal expected, actual.render
  end
end
