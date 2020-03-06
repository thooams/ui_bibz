# frozen_string_literal: true

require 'test_helper'

class ComponentTest < ActionView::TestCase
  test 'create complex component' do
    actual = UiBibz::Ui::Core::Component.new('New component', { state: :active, glyph: 'add' }, { class: 'new-class' }).render
    expected = '<i class="glyph fas fa-add"></i>  New component'

    assert_equal expected, actual
  end

  test 'create complex component with block' do
    actual = UiBibz::Ui::Core::Component.new(state: :active) do
      'New content'
    end.render
    expected = 'New content'

    assert_equal expected, actual
  end

  test 'create component without text and glyph' do
    actual = UiBibz::Ui::Core::Component.new('My text', { glyph: 'diamond', text: false }).render
    expected = '<i class="glyph fas fa-diamond"></i>'

    assert_equal expected, actual
  end
end
