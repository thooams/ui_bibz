require 'test_helper'

class TextFieldTest < ActionView::TestCase

    test 'text_field without prepend and append' do
      actual = UiBibz::Ui::Core::Forms::Texts::TextField.new('test').render
      expected = "<input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" />"

      assert_equal expected, actual
    end

    test 'text_field with prepend and append' do
      actual = UiBibz::Ui::Core::Forms::Texts::TextField.new('test', append: '1', prepend: '2').render
      expected = "<div class=\"input-group ui_surround_field\"><span class=\"input-group-addon\">1</span><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" /><span class=\"input-group-addon\">2</span></div>"

      assert_equal expected, actual
    end

    test 'text_field size' do
      actual = UiBibz::Ui::Core::Forms::Texts::TextField.new('test', size: :xs, append: '1', prepend: '2').render
      expected = "<div class=\"input-group-xs input-group ui_surround_field\"><span class=\"input-group-addon\">1</span><input type=\"text\" name=\"test\" id=\"test\" class=\"form-control\" /><span class=\"input-group-addon\">2</span></div>"

      assert_equal expected, actual
    end
end
