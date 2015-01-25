require 'test_helper'

include UiBibz::Helpers
class ComponentTest < ActionView::TestCase

  test 'create complex component' do
    UiBibz::Ui::Component.new('New component', {type: :active, glyph: 'add'}, { class: 'new-class'}).render
  end

  test 'create complex component with block' do
    UiBibz::Ui::Component.new(type: 'active') do
      "New content"
    end
  end
end
