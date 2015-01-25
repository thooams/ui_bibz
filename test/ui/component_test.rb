require 'test_helper'

include UiBibz::Helpers
class GlyphTest < ActionView::TestCase

  test 'create glyph with a name' do
    UiBibz::Ui::Glyph.new('add').render
  end

  test 'create glyph with hash' do
    UiBibz::Ui::Glyph.new({ name: 'add', size: 3}).render
  end
end
