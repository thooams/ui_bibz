# frozen_string_literal: true

require 'test_helper'

class GlyphComponentViewObjectTest < ActiveSupport::TestCase
  test 'render nil without option name' do
    glyph_component_view_object = UiBibz::ViewObjects::GlyphComponentViewObject.new({}, {})

    assert_nil glyph_component_view_object.render
  end

  test 'render glyph with name' do
    glyph_component_view_object = UiBibz::ViewObjects::GlyphComponentViewObject.new({ glyph: 'test' })

    assert_equal '<i class="glyph fa-solid fa-test"></i>', glyph_component_view_object.render
  end
end
