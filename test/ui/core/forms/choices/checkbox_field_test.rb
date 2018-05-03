require 'test_helper'

class CheckboxFieldTest < ActionView::TestCase

    test 'checkbox_field' do
      actual = UiBibz::Ui::Core::Forms::Choices::CheckboxField.new('John', { value: 1, status: :primary, type: :circle }).render
      expected = "<div class=\"abc-checkbox-primary form-check abc-checkbox abc-checkbox-circle\"><input type=\"checkbox\" name=\"John\" id=\"John\" value=\"1\" class=\"form-check-input\" /><label class=\"form-check-label\" for=\"John\">John</label></div>"

      assert_equal expected, actual
    end
end
