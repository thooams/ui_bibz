require 'test_helper'

include UiBibz::Helpers
class GlyphTest < ActionView::TestCase

  test 'create glyph with a name' do
    actual   = UiBibz::Ui::Core::Glyph.new('add').render
    expected = '<i class="glyph fa fa-add"></i>'
    assert_equal expected, actual
  end

  test 'create glyph with hash' do
    actual   = UiBibz::Ui::Core::Glyph.new({ name: 'add', size: 3, type: 'li'}).render
    expected = '<i class="glyph fa fa-add fa-3x fa-li"></i>'
    assert_equal expected, actual
  end

  test 'create glyph with name and hash' do
    actual   = UiBibz::Ui::Core::Glyph.new('add', { size: 3, type: 'li' }).render
    expected = '<i class="glyph fa fa-add fa-3x fa-li"></i>'
    assert_equal expected, actual
  end

  test 'create glyph with label' do
    actual   = UiBibz::Ui::Core::Glyph.new('add', { label: 'Example' }).render
    expected = "<i class=\"glyph fa fa-add\"></i> Example"
    assert_equal expected, actual
  end
end
