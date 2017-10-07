require 'test_helper'

class ButtonGroupTest < ActionView::TestCase

  test 'button group' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(position: :vertical).tap do |bg|
      bg.ui_button 'state'
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group btn-group-vertical\" role=\"group\"><button class=\"btn-primary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'button group choice checkbox' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new.tap do |bg|
      bg.ui_button_choice 'state1'
      bg.ui_button_choice 'state2'
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

  test 'button group choice radio' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new.tap do |bg|
      bg.ui_button_choice 'state1', type: :radio
      bg.ui_button_choice 'state2', type: :radio
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

end
