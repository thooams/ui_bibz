require 'test_helper'

include UiBibz::Helpers
class InputsTest < ActionView::TestCase

    test "Date Picker Field" do
      actual   = UiBibz::Ui::Core::DatePickerField.new(['date_1', 'date_2'], { append: 'a', prepend: 'b', range: 'u' }, { class: 'datepicker-test' }).render
      expected = "<div class=\"input-group input-daterange\"><span class=\"input-group-addon\">a</span><input type=\"text\" name=\"date_1\" id=\"date_1\" class=\"datepicker-test date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" /><span class=\"input-group-addon input-group-range\">u</span><input type=\"text\" name=\"date_2\" id=\"date_2\" class=\"datepicker-test date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" /><span class=\"input-group-addon\">b</span></div>"

      assert_equal expected, actual
    end

    test "Date Picker Field data html options" do
      actual   = UiBibz::Ui::Core::DatePickerField.new('date', { date_today_highlight: true, calendar_weeks: true, autoclose: true, dates_disabled: ["11/01/2016", "12/01/2016"] }, { class: 'datepicker-test' }).render
      expected = "<input type=\"text\" name=\"date\" id=\"date\" class=\"datepicker-test date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" data-date-today-highlight=\"true\" data-calendar-weeks=\"true\" data-autoclose=\"true\" data-dates-disabled=\"[&quot;11/01/2016&quot;,&quot;12/01/2016&quot;]\" />"

      assert_equal expected, actual
    end

    test "Multi Column Field" do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual   = UiBibz::Ui::Core::MultiColumnField.new('example', option_tags: options).render
      expected = "<select name=\"example[]\" id=\"example\" class=\"multi-column\" multiple=\"multiple\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></select>"

      assert_equal expected, actual
    end

    test "Multi Column Field data html options" do
      grouped_options = { 'North America' => [['United States','US'], 'Canada'], 'Europe' => ['Denmark','Germany','France'] }
      actual   = UiBibz::Ui::Core::MultiColumnField.new('example', { option_tags:  grouped_options_for_select(grouped_options), searchable: true, selectable_opt_group: true }).render
      expected = "<select name=\"example[]\" id=\"example\" data-searchable=\"true\" data-selectable-optgroup=\"true\" class=\"multi-column\" multiple=\"multiple\"><optgroup label=\"North America\"><option value=\"US\">United States</option>
<option value=\"Canada\">Canada</option></optgroup><optgroup label=\"Europe\"><option value=\"Denmark\">Denmark</option>
<option value=\"Germany\">Germany</option>
<option value=\"France\">France</option></optgroup></select>"

      assert_equal expected, actual
    end

    test "Multi Select Field" do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual   = UiBibz::Ui::Core::MultiSelectField.new('example', option_tags: options).render
      expected = "<select name=\"example[]\" id=\"example\" class=\"btn-primary btn multi-select\" multiple=\"multiple\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></select>"

      assert_equal expected, actual
    end

    test "Multi Select Field data html options" do
      grouped_options = { 'North America' => [['United States','US'], 'Canada'], 'Europe' => ['Denmark','Germany','France'] }
      actual   = UiBibz::Ui::Core::MultiSelectField.new('example', { option_tags: grouped_options_for_select(grouped_options), clickable_opt_group: true, collapsible_opt_group: true, searchable: true, select_all_option: true, state: :danger }).render
      expected = "<select name=\"example[]\" id=\"example\" data-enable-clickable-opt-groups=\"true\" data-enable-collapsible-opt-groups=\"true\" data-enable-filtering=\"true\" data-include-select-all-option=\"true\" class=\"btn-danger btn multi-select\" multiple=\"multiple\"><optgroup label=\"North America\"><option value=\"US\">United States</option>
<option value=\"Canada\">Canada</option></optgroup><optgroup label=\"Europe\"><option value=\"Denmark\">Denmark</option>
<option value=\"Germany\">Germany</option>
<option value=\"France\">France</option></optgroup></select>"

      assert_equal expected, actual
    end

    test 'surround_field without prepend and append' do
      actual = UiBibz::Ui::Core::SurroundField.new('test').render
      expected = "<input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" />"

      assert_equal expected, actual
    end

    test 'surround_field with prepend and append' do
      actual = UiBibz::Ui::Core::SurroundField.new('test', append: '1', prepend: '2').render
      expected = "<div class=\"input-group\"><span class=\"input-group-addon\">1</span><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" /><span class=\"input-group-addon\">2</span></div>"

      assert_equal expected, actual
    end

    test 'surround_field size' do
      actual = UiBibz::Ui::Core::SurroundField.new('test', size: :xs, append: '1', prepend: '2').render
      expected = "<div class=\"input-group input-group-xs\"><span class=\"input-group-addon\">1</span><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" /><span class=\"input-group-addon\">2</span></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field size' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', size: :lg).render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-size=\"large\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field animate' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', animate: false).render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-animate=\"false\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field checked' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', checked: true).render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" class=\"switch\" checked=\"checked\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field status' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', status: "disabled").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" disabled=\"disabled\" class=\"disabled switch\" />"

      assert_equal expected, actual
    end

    # NON FONCTIONNEL
    test 'switch_field readonly' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', readonly: true).render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" readonly=\"readonly\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field on_color' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', on_color: "success").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-on-color=\"success\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field off_color' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', off_color: "info").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-off-color=\"info\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field label_text' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', label_text: "testlabeltext").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-label-text=\"testlabeltext\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field on_text' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', on_text: 'testonlabel').render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-on-text=\"testonlabel\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field off_text' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', off_text: "testofflabel").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-off-text=\"testofflabel\" class=\"switch\" />"

      assert_equal expected, actual
    end
end
