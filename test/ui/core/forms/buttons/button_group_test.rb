# frozen_string_literal: true

require 'test_helper'

class ButtonGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'button group' do
    actual = ui_button_group do |bg|
      bg.button 'state'
    end
    expected = "<div class=\"btn-group\" role=\"group\"><button class=\"btn-secondary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'button group vertical' do
    actual = ui_button_group(position: :vertical) do |bg|
      bg.button 'state'
    end
    expected = "<div class=\"btn-group-vertical\" role=\"group\"><button class=\"btn-secondary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'button group status' do
    actual = ui_button_group(status: :primary) do |bg|
      bg.button 'state'
    end
    expected = "<div class=\"btn-group\" role=\"group\"><button class=\"btn-primary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'button group size' do
    actual = ui_button_group(size: :sm) do |bg|
      bg.button 'state'
    end
    expected = "<div class=\"btn-group btn-group-sm\" role=\"group\"><button class=\"btn-secondary btn btn-sm\">state</button></div>"

    assert_equal expected, actual
  end

  test 'button group with dropdown' do
    actual = ui_button_group do |bg|
      bg.dropdown("Dropdown", { type: :dropup, status: :success }, { id: 'dropdown-test' }) do |d|
        d.link 'Link 1', url: '#link1', glyph: 'eye'
      end
    end
    expected = "<div class=\"btn-group\" role=\"group\"><div id=\"dropdown-test\" class=\"dropup btn-group\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" id=\"dropdown-test\">Dropdown</button><div class=\"dropdown-menu\" arial-labelledby=\"dropdown-test\"><a class=\"dropdown-item\" href=\"#link1\"><i class=\"glyph fas fa-eye\"></i>  Link 1</a></div></div></div>"

    assert_equal expected, actual
  end

end
