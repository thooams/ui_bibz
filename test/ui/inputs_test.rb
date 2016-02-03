require 'test_helper'

include UiBibz::Helpers
class InputsTest < ActionView::TestCase

    test "Date Picker Field" do
      actual   = UiBibz::Ui::Core::DatePickerField.new('date', { append: 'a', prepend: 'b', range: 'u' }, { class: 'datepicker-test' }).render
      expected = "<div class=\"input-group input-daterange\"><span class=\"input-group-addon\">a</span><input type=\"text\" name=\"date\" id=\"date\" class=\"datepicker-test date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" /><span class=\"input-group-addon input-group-range\">u</span><input type=\"text\" name=\"date\" id=\"date\" class=\"datepicker-test date_picker form-control form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" /><span class=\"input-group-addon\">b</span></div>"

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

end
