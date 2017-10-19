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
      bg.button 'state'
    end
    expected = "<div class=\"btn-group\" role=\"group\"><button class=\"btn-primary btn\">state</button></div>"

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
