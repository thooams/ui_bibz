require 'test_helper'

class ChoiceGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Choice group checkbox' do
    actual   = ui_choice_group do |bc|
      bc.choice 'Checkbox 1'
      bc.choice 'Checkbox 2', state: :active
    end
    expected = "<div data-toggle=\"buttons\" class=\"btn-group button-choice btn-group-toggle\"><label class=\"btn-secondary btn checkbox\"><input type=\"checkbox\" autocomplete=\"off\" />Checkbox 1</label><label class=\"active btn-secondary btn checkbox\" aria-pressed=\"true\"><input type=\"checkbox\" autocomplete=\"off\" checked=\"checked\" />Checkbox 2</label></div>"

    assert_equal expected, actual
  end

  test 'Choice group radio' do
    actual = ui_choice_group type: :radio do |bc|
      bc.choice 'Radio 1'
      bc.choice 'Radio 2', state: :active
    end
    expected = "<div data-toggle=\"buttons\" class=\"btn-group button-choice btn-group-toggle\"><label class=\"btn-secondary btn radio\"><input type=\"radio\" autocomplete=\"off\" />Radio 1</label><label class=\"active btn-secondary btn radio\" aria-pressed=\"true\"><input type=\"radio\" autocomplete=\"off\" checked=\"checked\" />Radio 2</label></div>"

    assert_equal expected, actual
  end

  test 'Choice group options' do
    actual = ui_choice_group size: :lg, outline: true, type: :radio do |bc|
      bc.choice 'Radio 1', glyph: 'diamond', status: :primary
      bc.choice 'Radio 2', state: :active
    end
    expected = "<div data-toggle=\"buttons\" class=\"btn-group btn-group-lg button-choice btn-group-toggle\"><label class=\"btn-outline-primary btn btn-lg radio\"><input type=\"radio\" autocomplete=\"off\" /><i class=\"glyph fas fa-diamond\"></i>  Radio 1</label><label class=\"active btn-outline-secondary btn btn-lg radio\" aria-pressed=\"true\"><input type=\"radio\" autocomplete=\"off\" checked=\"checked\" />Radio 2</label></div>"

    assert_equal expected, actual
  end

end
