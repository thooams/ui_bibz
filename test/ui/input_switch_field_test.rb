require 'test_helper'

include UiBibz::Helpers
class InputsSwitchFieldTest < ActionView::TestCase

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
      actual = UiBibz::Ui::Core::SwitchField.new('test', {}, checked: true).render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" checked=\"checked\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field state' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', {}, state: "disabled").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" state=\"disabled\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # NON FONCTIONNEL
    test 'switch_field readonly' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', {}, readonly: true).render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" readonly=\"readonly\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field left_color' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', left_color: "success").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-on-color=\"success\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field right_color' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', right_color: "info").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-off-color=\"info\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field middle_text' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', middle_text: "testlabeltext").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-label-text=\"testlabeltext\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field left_text' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', left_text: 'testonlabel').render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-on-text=\"testonlabel\" class=\"switch\" />"

      assert_equal expected, actual
    end

    # OK
    test 'switch_field right_text' do
      actual = UiBibz::Ui::Core::SwitchField.new('test', right_text: "testofflabel").render
      expected = "<input type=\"checkbox\" name=\"test\" id=\"test\" data-off-text=\"testofflabel\" class=\"switch\" />"

      assert_equal expected, actual
    end

end
