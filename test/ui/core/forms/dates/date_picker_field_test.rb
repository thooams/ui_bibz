require 'test_helper'
include UiBibz::Helpers

class DatePickerFieldTest < ActionView::TestCase

    test "Date Picker Field" do
      actual   = UiBibz::Ui::Core::Forms::Dates::DatePickerField.new(['date_1', 'date_2'], { append: 'a', prepend: 'b', range: 'u' }, { class: 'datepicker-test' }).render
      expected = "<div class=\"input-daterange input-group\"><span class=\"input-group-addon\">a</span><input type=\"text\" name=\"date_1\" id=\"date_1\" class=\"datepicker-test date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" /><span class=\"input-group-addon\">u</span><input type=\"text\" name=\"date_2\" id=\"date_2\" class=\"datepicker-test date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" /><span class=\"input-group-addon\">b</span></div>"

      assert_equal expected, actual
    end

    test "Date Picker Field data html options" do
      actual   = UiBibz::Ui::Core::Forms::Dates::DatePickerField.new('date', { today_highlight: true, calendar_weeks: true, autoclose: true, dates_disabled: ["11/01/2016", "12/01/2016"] }, { class: 'datepicker-test' }).render
      expected = "<input type=\"text\" name=\"date\" id=\"date\" class=\"datepicker-test date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" data-date-today-highlight=\"true\" data-date-calendar-weeks=\"true\" data-date-autoclose=\"true\" data-dates-disabled=\"[&quot;11/01/2016&quot;,&quot;12/01/2016&quot;]\" />"

      assert_equal expected, actual
    end
end
