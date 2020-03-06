# frozen_string_literal: true

require 'test_helper'

class MultiColumnFieldTest < ActionView::TestCase

    test "Multi Column Field" do
      options  = options_for_select(2.times.map{ |i| "option #{i}" })
      actual   = UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new('example', option_tags: options).render
      expected = "<select name=\"example[]\" id=\"example\" class=\"multi-column-field\" multiple=\"multiple\"><option value=\"option 0\">option 0</option>
<option value=\"option 1\">option 1</option></select>"

      assert_equal expected, actual
    end

    test "Multi Column Field data html options" do
      grouped_options = { 'North America' => [['United statuss','US'], 'Canada'], 'Europe' => ['Denmark','Germany','France'] }
      actual   = UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new('example', { option_tags:  grouped_options_for_select(grouped_options), searchable: true, selectable_opt_group: true }).render
      expected = "<select name=\"example[]\" id=\"example\" data-searchable=\"true\" data-selectable-optgroup=\"true\" class=\"multi-column-field\" multiple=\"multiple\"><optgroup label=\"North America\"><option value=\"US\">United statuss</option>
<option value=\"Canada\">Canada</option></optgroup><optgroup label=\"Europe\"><option value=\"Denmark\">Denmark</option>
<option value=\"Germany\">Germany</option>
<option value=\"France\">France</option></optgroup></select>"

      assert_equal expected, actual
    end
end
