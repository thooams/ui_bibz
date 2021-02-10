# frozen_string_literal: true

require 'test_helper'

class RadioFieldTest < ActionView::TestCase
  test 'radio_field' do
    actual = UiBibz::Ui::Core::Forms::Choices::RadioField.new('John', { value: 1, status: :primary, type: :square }).render
    expected = "<div class=\"form-check\"><input type=\"radio\" name=\"John\" id=\"John_1\" value=\"1\" class=\"form-check-input form-check-input-primary\" /><label class=\"form-check-label\" for=\"John_1\">John</label></div>"

    assert_equal expected, actual
  end

  test 'checkbox_field with options and html_options' do
    actual = UiBibz::Ui::Core::Forms::Choices::RadioField.new('John', action: 'click->controller#action', label_html: { class: 'test' }, wrapper_html: { title: "My title" }).render
    expected = "<div title=\"My title\" class=\"form-check\"><input type=\"radio\" name=\"John\" id=\"John_\" data-action=\"click-&gt;controller#action\" class=\"form-check-input\" /><label class=\"form-check-label\" for=\"John_\">John</label></div>"

    assert_equal expected, actual
  end
end
