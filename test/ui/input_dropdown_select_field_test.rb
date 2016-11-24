require 'test_helper'

include UiBibz::Helpers
class InputDropdownSelectFieldTest < ActionView::TestCase

    test 'dropdowm_select_field' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', options_tags: options).render
      expected = "<select name=\"test\" id=\"test\" class=\"selectpicker\"></select>"

      assert_equal expected, actual
    end

    test 'dropdowm_select_field searchable' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', { options_tags: options, searchable: true }).render
      expected = "<select name=\"test\" id=\"test\" data-live-search=\"true\" class=\"selectpicker\"></select>"

      assert_equal expected, actual
    end

    test 'dropdowm_select_field max_options' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', { options_tags: options, max_options: 2 }).render
      expected = "<select name=\"test\" id=\"test\" data-max-options=\"2\" class=\"selectpicker\"></select>"

      assert_equal expected, actual
    end

    test 'dropdowm_select_field selected_text_format' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', { options_tags: options, selected_text_format: "count > x" }).render
      expected = "<select name=\"test\" id=\"test\" data-selected-text-format=\"count &gt; x\" class=\"selectpicker\"></select>"

      assert_equal expected, actual
    end

    test 'dropdowm_select_field menu_size' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', { options_tags: options, menu_size: 2 }).render
      expected = "<select name=\"test\" id=\"test\" data-size=\"2\" class=\"selectpicker\"></select>"

      assert_equal expected, actual
    end

    test 'dropdowm_select_field actions_box' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', { options_tags: options, actions_box: true }).render
      expected = "<select name=\"test\" id=\"test\" data-actions-box=\"true\" class=\"selectpicker\"></select>"

      assert_equal expected, actual
    end

    test 'dropdowm_select_field show_tick' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', { options_tags: options, show_tick: true }).render
      expected = "<select name=\"test\" id=\"test\" class=\"selectpicker show-tick\"></select>"

      assert_equal expected, actual
    end

    test 'dropdowm_select_field show_menu_arrow' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', { options_tags: options, show_menu_arrow: true }).render
      expected = "<select name=\"test\" id=\"test\" class=\"selectpicker show-menu-arrow\"></select>"

      assert_equal expected, actual
    end

    test 'dropdowm_select_field dropup' do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual = UiBibz::Ui::Core::Inputs::Selects::DropdownSelectField.new('test', { options_tags: options, dropup: true }).render
      expected = "<select name=\"test\" id=\"test\" class=\"selectpicker dropup\"></select>"

      assert_equal expected, actual
    end

end
