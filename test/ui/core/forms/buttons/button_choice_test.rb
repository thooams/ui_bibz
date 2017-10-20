require 'test_helper'

class ButtonChoiceTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Button choice checkbox' do
    actual   = ui_button_choice do |bc|
      bc.button 'Checkbox 1'
      bc.button 'Checkbox 2', state: :active
    end
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\"><label class=\"btn-secondary btn\"><input type=\"checkbox\" autocomplete=\"off\" />Checkbox 1</label><label class=\"active btn-secondary btn\" aria-pressed=\"true\"><input type=\"checkbox\" autocomplete=\"off\" checked=\"checked\" />Checkbox 2</label></div>"

    assert_equal expected, actual
  end

  test 'Button choice radio' do
    actual = ui_button_choice type: :radio do |bc|
      bc.button 'Radio 1'
      bc.button 'Radio 2', state: :active
    end
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\"><label class=\"btn-secondary btn\"><input type=\"radio\" autocomplete=\"off\" />Radio 1</label><label class=\"active btn-secondary btn\" aria-pressed=\"true\"><input type=\"radio\" autocomplete=\"off\" checked=\"checked\" />Radio 2</label></div>"

    assert_equal expected, actual
  end

  test 'Button choice options' do
    actual = ui_button_choice size: :lg, outline: true, type: :radio do |bc|
      bc.button 'Radio 1', glyph: 'diamond', status: :primary
      bc.button 'Radio 2', state: :active
    end
    expected = "<div data-toggle=\"buttons\" class=\"btn-group btn-group-lg\"><label class=\"btn-primary btn btn-lg\"><input type=\"radio\" autocomplete=\"off\" /><i class=\"glyph fa fa-diamond\"></i> Radio 1</label><label class=\"active btn-secondary btn btn-lg\" aria-pressed=\"true\"><input type=\"radio\" autocomplete=\"off\" checked=\"checked\" />Radio 2</label></div>"

    assert_equal expected, actual
  end

end
