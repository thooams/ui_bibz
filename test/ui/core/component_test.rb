require 'test_helper'

class ComponentTest < ActionView::TestCase

  test 'create complex component' do
    actual = UiBibz::Ui::Core::Component.new('New component', { state: :active, glyph: 'add' }, { class: 'new-class' }).render
    expected = '<i class="glyph fa fa-add"></i> New component'

    assert_equal expected, actual
  end

  test 'create complex component with block' do
    actual = UiBibz::Ui::Core::Component.new(state: :active) do
      "New content"
    end.render
    expected = 'New content'

    assert_equal expected, actual
  end
end
