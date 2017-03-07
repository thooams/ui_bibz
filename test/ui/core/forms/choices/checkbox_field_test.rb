require 'test_helper'
include UiBibz::Helpers

class CheckboxFieldTest < ActionView::TestCase

    test 'checkbox_field' do
      actual = UiBibz::Ui::Core::Forms::Choices::CheckboxField.new('John', { value: 1, status: :primary, type: :circle }).render
      expected = "<div class=\"abc-checkbox-primary checkbox abc-checkbox abc-checkbox-circle\"><input type=\"checkbox\" name=\"John\" id=\"John\" value=\"1\" class=\"styled\" /><label for=\"John\">John</label></div>"

      assert_equal expected, actual
    end              
end
