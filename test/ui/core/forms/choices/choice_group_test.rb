# frozen_string_literal: true

require 'test_helper'

class ChoiceGroupTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Choice group checkbox' do
    actual = UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new.tap do |bc|
      bc.choice 'Checkbox 1'
      bc.choice 'Checkbox 2', state: :active
    end

    expected = "<div data-toggle=\"buttons\" class=\"btn-group button-choice btn-group-toggle\"><input type=\"checkbox\" autocomplete=\"off\" class=\"btn-check\" id=\"#{actual.items.first.input_options[:id]}\" /><label class=\"btn-secondary btn checkbox\" for=\"#{actual.items.first.input_options[:id]}\">Checkbox 1</label><input type=\"checkbox\" autocomplete=\"off\" class=\"btn-check\" checked=\"checked\" id=\"#{actual.items.last.input_options[:id]}\" /><label class=\"active btn-secondary btn checkbox\" aria-pressed=\"true\" for=\"#{actual.items.last.input_options[:id]}\">Checkbox 2</label></div>"

    assert_equal expected, actual.render
  end

  test 'Choice group radio' do
    actual = UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new(type: :radio).tap do |bc|
      bc.choice 'Radio 1'
      bc.choice 'Radio 2', state: :active
    end

    expected = "<div data-toggle=\"buttons\" class=\"btn-group button-choice btn-group-toggle\"><input type=\"radio\" autocomplete=\"off\" class=\"btn-check\" name=\"#{actual.items.first.input_options[:name]}\" id=\"#{actual.items.first.input_options[:id]}\" /><label class=\"btn-secondary btn radio\" for=\"#{actual.items.first.input_options[:id]}\">Radio 1</label><input type=\"radio\" autocomplete=\"off\" class=\"btn-check\" checked=\"checked\" name=\"#{actual.items.last.input_options[:name]}\" id=\"#{actual.items.last.input_options[:id]}\" /><label class=\"active btn-secondary btn radio\" aria-pressed=\"true\" for=\"#{actual.items.last.input_options[:id]}\">Radio 2</label></div>"

    assert_equal expected, actual.render
  end

  test 'Choice group options' do
    actual = UiBibz::Ui::Core::Forms::Choices::ChoiceGroup.new(size: :lg, outline: true, type: :radio).tap do |bc|
      bc.choice 'Radio 1', glyph: 'diamond', status: :primary
      bc.choice 'Radio 2', state: :active
    end
    expected = "<div data-toggle=\"buttons\" class=\"btn-group btn-group-lg button-choice btn-group-toggle\"><input type=\"radio\" autocomplete=\"off\" class=\"btn-check\" name=\"#{actual.items.first.input_options[:name]}\" id=\"#{actual.items.first.input_options[:id]}\" /><label class=\"btn-outline-primary btn btn-lg radio\" for=\"#{actual.items.first.input_options[:id]}\"><i class=\"glyph fas fa-diamond\"></i> Radio 1</label><input type=\"radio\" autocomplete=\"off\" class=\"btn-check\" checked=\"checked\" name=\"#{actual.items.last.input_options[:name]}\" id=\"#{actual.items.last.input_options[:id]}\" /><label class=\"active btn-outline-secondary btn btn-lg radio\" aria-pressed=\"true\" for=\"#{actual.items.last.input_options[:id]}\">Radio 2</label></div>"

    assert_equal expected, actual.render
  end
end
