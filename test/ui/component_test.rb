require 'test_helper'

include UiBibz::Helpers
class ComponentTest < ActionView::TestCase

  test 'create complex component' do
    actual = UiBibz::Ui::Component.new('New component', {type: :active, glyph: 'add'}, { class: 'new-class'}).render
    expected = '<i class="glyph fa fa-add"></i> New component'
    assert_equal expected, actual
  end

  test 'create complex component with block' do
    actual = UiBibz::Ui::Component.new(type: 'active') do
      "New content"
    end.render
    expected = 'New content'
    assert_equal expected, actual
  end
end
