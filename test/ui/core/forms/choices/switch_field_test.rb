require 'test_helper'

class SwitchFieldTest < ActionView::TestCase

    # OK
    test 'switch_field size' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', size: :lg).render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" data-size=\"large\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field animate' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', animate: false).render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" data-animate=\"false\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field checked' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', {}, checked: true).render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" checked=\"checked\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field state' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', {}, state: "disabled").render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" state=\"disabled\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # NON FONCTIONNEL
    test 'switch_field readonly' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', {}, readonly: true).render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" readonly=\"readonly\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field left_color' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', left_color: "success").render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" data-on-color=\"success\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field right_color' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', right_color: "info").render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" data-off-color=\"info\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field middle_text' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', middle_text: "testlabeltext").render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" data-label-text=\"testlabeltext\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field left_text' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', left_text: 'testonlabel').render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" data-on-text=\"testonlabel\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field right_text' do
      actual = UiBibz::Ui::Core::Forms::Choices::SwitchField.new('test', right_text: "testofflabel").render
      expected = "<div class=\"switch-field-container\"><input type=\"hidden\" name=\"test\" id=\"test\" value=\"0\" /><input type=\"checkbox\" name=\"test\" id=\"test\" value=\"1\" data-off-text=\"testofflabel\" class=\"switch-field\" /></div>"

      assert_equal expected, actual
    end

end
