require 'test_helper'

class ButtonChoiceTest < ActionView::TestCase

  test 'checkbox button checked' do
    actual   = ui_button_choice('state', { state: :active })
    expected = "<label class=\"active btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" checked=\"checked\" />state</label>"

    assert_equal expected, actual
  end

  test 'checkbox button non checked' do
    actual   = ui_button_choice('state', { name: 'state', id: 'state', input_html_options: { class: 'state'}})
    expected = "<label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" name=\"state\" id=\"state\" class=\"state\" />state</label>"

    assert_equal expected, actual
  end

end
