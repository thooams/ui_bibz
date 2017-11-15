require 'test_helper'
class ToolbarTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Toolbar' do
    actual = ui_toolbar do |t|
      t.button_group do |bg|
        bg.button 'Home'
      end
    end
    expected = "<div class=\"btn-toolbar\" role=\"toolbar\"><div class=\"btn-group\" role=\"group\"><button class=\"btn\">Home</button></div></div>"

    assert_equal expected, actual
  end

  test 'Toolbar justify' do
    actual = ui_toolbar justify: true do |t|
      t.button_group space: 2 do |bg|
        bg.button 'Home'
      end
      t.button_group do |bg|
        bg.button 'Home 2'
      end
    end
    expected = "<div class=\"btn-toolbar justify-content-between\" role=\"toolbar\"><div class=\"btn-group mr-2\" role=\"group\"><button class=\"btn\">Home</button></div><div class=\"btn-group\" role=\"group\"><button class=\"btn\">Home 2</button></div></div>"

    assert_equal expected, actual
  end

end
