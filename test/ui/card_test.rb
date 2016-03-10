require 'test_helper'
include UiBibz::Helpers
include UiBibz::Helpers::UiCoreHelper
class CardTest < ActionView::TestCase

  test 'create card' do
    actual = card do
      'test'
    end
    expected = "<div class=\"card card-block\">test</div>"

    assert_equal expected, actual
  end

  test 'create card with image, list and block' do
    actual = card(tap: true) do |c|
      c.image 'image.svg'
      c.block do
        "test"
      end
      c.list_group do |lg|
        lg.list "Cras justo odio"
        lg.list "Dapibas ac facilisis in"
        lg.list "vestibulum at eros"
      end
      c.block do
        link_to "Card link", '#', class: "card-link"
        link_to "Card link", '#', class: "card-link"
      end
    end
    expected = "<div class=\"card\"><img src=\"/assets/image.svg\" alt=\"Image\" /><div class=\"card-block\">test</div><ul class=\"list-group-flush list-group\"><li class=\"list-group-item\">Cras justo odio</li><li class=\"list-group-item\">Dapibas ac facilisis in</li><li class=\"list-group-item\">vestibulum at eros</li></ul><div class=\"card-block\"><a class=\"card-link\" href=\"#\">Card link</a></div></div>"

    assert_equal expected, actual
  end

  test 'create card with header, block and footer' do
    actual = card(state: :danger, tap: true, class: 'toto') do |p|
      p.header 'toto', glyph: 'eye'
      p.block 'toto'
      p.footer 'toto'
    end
    expected = "<div class=\"card-danger toto card\"><div class=\"card-header\"><i class=\"glyph fa fa-eye\"></i> toto</div><div class=\"card-block\">toto</div><div class=\"card-footer\">toto</div></div>"

    assert_equal expected, actual
  end

  test 'create card group' do
    actual = card_group do |cg|
      cg.card 'test 1', block: true
      cg.card 'test 2', block: true
      cg.card 'test 3', block: true
    end
    expected = "<div class=\"card-group\"><div class=\"card card-block\">test 1</div><div class=\"card card-block\">test 2</div><div class=\"card card-block\">test 3</div></div>"

    assert_equal expected, actual
  end

  test 'create card deck' do
    actual = card_deck do |cg|
      cg.card 'test 1', block: true
      cg.card 'test 2', block: true
      cg.card 'test 3', block: true
    end
    expected = "<div class=\"card-deck-wrapper\"><div class=\"card-deck\"><div class=\"card card-block\">test 1</div><div class=\"card card-block\">test 2</div><div class=\"card card-block\">test 3</div></div></div>"

    assert_equal expected, actual
  end

  test 'create card column' do
    actual = card_column do |cg|
      cg.card 'test 1', block: true
      cg.card 'test 2', block: true
      cg.card 'test 3', block: true
    end
    expected = "<div class=\"card-columns\"><div class=\"card card-block\">test 1</div><div class=\"card card-block\">test 2</div><div class=\"card card-block\">test 3</div></div>"

    assert_equal expected, actual
  end

  test 'card list group' do
    actual = card tap: true do |c|
      c.list_group do |lg|
        lg.list "list 1"
        lg.list "list 2"
        lg.list "list 3"
      end
    end
    expected = "<div class=\"card\"><ul class=\"list-group-flush list-group\"><li class=\"list-group-item\">list 1</li><li class=\"list-group-item\">list 2</li><li class=\"list-group-item\">list 3</li></ul></div>"

    assert_equal expected, actual
  end

  test 'card block parameters' do
    actual = card tap: true do |c|
      c.block tap: true do |b|
        b.title "title"
        b.text "text"
        b.link 'link'
      end
    end
    expected = "<div class=\"card\"><div class=\"card-block\"><h4 class=\"card-title\">title</h4><p class=\"card-text\">text</p><a class=\"card-title\">link</a></div></div>"

    assert_equal expected, actual
  end

end
