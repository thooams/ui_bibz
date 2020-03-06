# frozen_string_literal: true

require 'test_helper'


class GlyphTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'create glyph with a name' do
    actual   = ui_glyph('add')
    expected = '<i class="glyph fas fa-add"></i>'
    assert_equal expected, actual
  end

  test 'create glyph with hash' do
    actual   = ui_glyph({ name: 'add', size: 3, type: 'li'})
    expected = '<i class="glyph fas fa-add fa-3x fa-li"></i>'
    assert_equal expected, actual
  end

  test 'create glyph with name and hash' do
    actual   = ui_glyph('add', { size: 3, type: 'li' })
    expected = '<i class="glyph fas fa-add fa-3x fa-li"></i>'
    assert_equal expected, actual
  end

  test 'create glyph with label' do
    actual   = ui_glyph('add', { label: 'Example' })
    expected = "<i class=\"glyph fas fa-add\"></i> Example"
    assert_equal expected, actual
  end

end
