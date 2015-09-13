require 'test_helper'
include UiBibz::Helpers
class CardTest < ActionView::TestCase

  test 'create card' do
    actual = card do
      'test'
    end
    expected = "<div class=\"card\">test</div>"

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
    expected = "<div class=\"card\"><img src=\"/images/image.svg\" alt=\"Image\" /><div class=\"card-block\">test</div><ul class=\"list-group-flush list-group\"><li class=\"list-group-item\">Cras justo odio</li><li class=\"list-group-item\">Dapibas ac facilisis in</li><li class=\"list-group-item\">vestibulum at eros</li></ul><div class=\"card-block\"><a class=\"card-link\" href=\"#\">Card link</a></div></div>"

    assert_equal expected, actual
  end

  test 'create card with header, block and footer' do
    actual = card(state: :danger, tap: true, class: 'toto') do |p|
      p.header 'toto', glyph: 'eye'
      p.block 'toto'
      p.footer 'toto'
    end
    expected = "<div class=\"card-danger toto card\"><div class=\"card-header\">toto</div><div class=\"card-block\">toto</div><div class=\"card-footer\">toto</div></div>"

    assert_equal expected, actual
  end


end
