require 'test_helper'
include UiBibz::Helpers

class ButtonGroupTest < ActionView::TestCase

  test 'button group' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new position: :vertical do
      UiBibz::Ui::Core::Forms::Buttons::Button.new('state').render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group btn-group-vertical\" role=\"group\"><button class=\"btn-primary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'button group choice checkbox' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new do
      concat UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state1').render
      concat UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state2').render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

  test 'button group choice radio' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new do
      concat UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state1', type: :radio).render
      concat UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state2', type: :radio).render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

end
