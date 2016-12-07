require 'test_helper'

include UiBibz::Helpers
class ButtonTest < ActionView::TestCase

  test "button" do
    actual   = UiBibz::Ui::Core::Forms::Buttons::Button.new('state', status: :success).render
    expected = "<button class=\"btn-success btn\">state</button>"

    assert_equal expected, actual
  end

  test 'button group' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new position: :vertical do
      UiBibz::Ui::Core::Forms::Buttons::Button.new('state').render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group btn-group-vertical\" role=\"group\"><button class=\"btn-primary btn\">state</button></div>"

    assert_equal expected, actual
  end

  test 'link button' do
    actual   = UiBibz::Ui::Core::Forms::Buttons::ButtonLink.new('state', { url: users_path, status: :danger, glyph: 'add'}).render
    expected = "<a class=\"btn-danger btn\" href=\"/users\"><i class=\"glyph fa fa-add\"></i> state</a>"

    assert_equal expected, actual
  end

  test 'button outline' do
    actual   = UiBibz::Ui::Core::Forms::Buttons::Button.new('state', status: :success, outline: true).render
    expected = "<button class=\"btn-outline-success btn\">state</button>"

    assert_equal expected, actual
  end

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

  test 'button group choice checkbox' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new do
      concat UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state1').render
      concat UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state2').render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"checkbox\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

  test 'button group choice radio' do
    actual = UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new do
      concat UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state1', type: :radio).render
      concat UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('state2', type: :radio).render
    end.render
    expected = "<div data-toggle=\"buttons\" class=\"btn-group\" role=\"group\"><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state1</label><label class=\"btn-primary btn\"><input type=\"radio\" autocomplete=\"off\" />state2</label></div>"

    assert_equal expected, actual
  end

end
