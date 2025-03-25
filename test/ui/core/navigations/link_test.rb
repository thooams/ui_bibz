# frozen_string_literal: true

require 'test_helper'
class LinkTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'Link' do
    actual = ui_link 'My link', url: '#link'
    expected = '<a href="#link">My link</a>'

    assert_equal expected, actual
  end

  test 'Link without text' do
    actual = ui_link 'My link', glyph: 'gem', text: false, url: '#link'
    expected = "<a href=\"#link\"><i class=\"glyph fa-solid fa-gem\"></i> <span class=\"visually-hidden\">My link</span></a>"

    assert_equal expected, actual
  end

  test 'Link with collapse option' do
    actual = ui_link 'My link', url: '#link', collapse: 'collapse-id'
    expected = '<a role="button" data-bs-toggle="collapse" aria-controls="collapse-id" aria-expanded="false" href="#link">My link</a>'

    assert_equal expected, actual
  end

  test 'confirm option' do
    actual = ui_link 'My link', url: '#link', confirm: "Are you sure?"
    expected = "<a data-confirm=\"Are you sure?\" href=\"#link\">My link</a>"

    assert_equal expected, actual
  end
end
