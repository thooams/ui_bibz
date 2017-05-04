require 'test_helper'

class ButtonChoiceTest < ActionView::TestCase

  test 'checkbox button checked' do
    actual   = UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state', { state: :active }).render
    expected = "<label class=\"active btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" checked=\"checked\" />state</label>"

    assert_equal expected, actual
  end

  test 'checkbox button non checked' do
    actual   = UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state', { name: 'state', id: 'state', input_html_options: { class: 'state'}}).render
    expected = "<label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" name=\"state\" id=\"state\" class=\"state\" />state</label>"

    assert_equal expected, actual
  end

end
