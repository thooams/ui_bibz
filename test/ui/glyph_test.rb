require 'test_helper'

include UiBibz::Helpers
class GlyphTest < ActionView::TestCase

  test 'create glyph with a name' do
    actual   = UiBibz::Ui::Glyph.new('add').render
    expected = '<i class="glyph fa fa-add fa-1x"></i>'
    assert_equal expected, actual
  end

  test 'create glyph with hash' do
    actual   = UiBibz::Ui::Glyph.new({ name: 'add', size: 3, type: 'li'}).render
    expected = '<i class="glyph fa fa-add fa-3x fa-li"></i>'
    assert_equal expected, actual
  end
end
