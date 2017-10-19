require 'test_helper'

class ButtonGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'button group' do
    actual = ui_button_group do |bg|
      bg.button 'state'
    end
    expected = "<div class=\"btn-group\" role=\"group\"><button class=\"btn-primary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'button group vertical' do
    actual = ui_button_group(position: :vertical) do |bg|
      bg.button 'state'
    end
    expected = "<div class=\"btn-group-vertical\" role=\"group\"><button class=\"btn-primary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'button group with dropdown' do
    actual = ui_button_group do |bg|
      bg.dropdown("Dropdown", type: :dropup, status: :success) do |d|
        d.link 'Link 1', url: '#link1', glyph: 'eye'
      end
    end
    expected = "<div class=\"btn-group\" role=\"group\"><div class=\"dropup btn-group\"><button class=\"btn btn-success dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></button><div class=\"dropdown-menu dropdown-menu-left\"><a class=\"dropdown-item\" href=\"#link1\"><i class=\"glyph fa fa-eye\"></i> Link 1</a></div></div></div>"

    assert_equal expected, actual
  end

  test 'button group choice checkbox' do
    actual = ui_button_group do |bg|
      bg.button_choice 'state1'
      bg.button_choice 'state2'
    end
    expected = "<div class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

  test 'button group choice radio' do
    actual = ui_button_group do |bg|
      bg.button_choice 'state1', type: :radio
      bg.button_choice 'state2', type: :radio
    end
    expected = "<div class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end


end
