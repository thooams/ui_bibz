require 'test_helper'

class RadioFieldTest < ActionView::TestCase

    test 'radio_field' do
      actual = UiBibz::Ui::Core::Forms::Choices::RadioField.new('John', { value: 1, status: :primary, type: :square }).render
      expected = "<div class=\"abc-checkbox-primary checkbox abc-checkbox\"><input type=\"radio\" name=\"John\" id=\"John_1\" value=\"1\" /><label for=\"John_1\">John</label></div>"

      assert_equal expected, actual
    end
end
