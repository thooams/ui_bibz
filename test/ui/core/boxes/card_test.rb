# frozen_string_literal: true

require 'test_helper'

class CardTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'create card' do
    actual = ui_card do
      'test'
    end
    expected = '<div class="card"><div class="card-body">test</div></div>'

    assert_equal expected, actual
  end

  test 'card status' do
    actual = ui_card 'test', status: :primary
    expected = '<div class="bg-primary text-white card"><div class="card-body">test</div></div>'

    assert_equal expected, actual
  end

  test 'card outline' do
    actual = ui_card 'test', status: :success, outline: true do |c|
      c.header 'header'
      c.body 'header'
      c.footer 'header'
    end
    expected = '<div class="border-success text-white card bg-transparent"><div class="card-header text-success border-success bg-transparent">header</div><div class="card-body">test</div><div class="card-body text-success">header</div><div class="card-footer text-success border-success bg-transparent">header</div></div>'

    assert_equal expected, actual
  end

  test 'create card with image, list and body' do
    actual = ui_card(tap: true) do |c|
      c.image 'image.svg'
      c.body do
        'test'
      end
      c.list_group do |lg|
        lg.list 'Cras justo odio'
        lg.list 'Dapibas ac facilisis in'
        lg.list 'vestibulum at eros'
      end
      c.body do
        link_to 'Card link', '#', class: 'card-link'
        link_to 'Card link', '#', class: 'card-link'
      end
    end
    expected = '<div class="card"><img class="card-img-top" src="/images/image.svg" /><div class="card-body">test</div><ul class="list-group-flush list-group"><li class="list-group-item">Cras justo odio</li><li class="list-group-item">Dapibas ac facilisis in</li><li class="list-group-item">vestibulum at eros</li></ul><div class="card-body"><a class="card-link" href="#">Card link</a></div></div>'

    assert_equal expected, actual
  end

  test 'create card with header, body and footer' do
    actual = ui_card tap: true, class: 'state' do |p|
      p.header 'state', glyph: 'eye'
      p.body 'state'
      p.footer 'state'
    end
    expected = "<div class=\"state card\"><div class=\"card-header\"><i class=\"glyph fa-solid fa-eye\"></i> state</div><div class=\"card-body\">state</div><div class=\"card-footer\">state</div></div>"

    assert_equal expected, actual
  end

  test 'position' do
    actual = ui_card text: { position: :right, size: :md } do |p|
      p.body do |b|
        b.title 'Special title treatment'
        b.subtitle 'The subtitle'
        b.text 'With supporting text below as a natural lead-in to additional content.'
        b.link 'Go somewhere', url: '#go-somewhere', class: 'btn btn-primary'
      end
    end
    expected = "<div class=\"card text-md-right\"><div class=\"card-body\"><h5 class=\"card-title\">Special title treatment</h5><h6 class=\"card-subtitle mb-2 text-muted\">The subtitle</h6><p class=\"card-text\">With supporting text below as a natural lead-in to additional content.</p><a class=\"btn btn-primary card-link\" href=\"#go-somewhere\">Go somewhere</a></div></div>"

    assert_equal expected, actual
  end

  test 'create card group' do
    actual = ui_card_group do |cg|
      cg.card 'test 1', body: true
      cg.card 'test 2', body: true
      cg.card 'test 3', body: true
    end
    expected = '<div class="card-group"><div class="card"><div class="card-body">test 1</div></div><div class="card"><div class="card-body">test 2</div></div><div class="card"><div class="card-body">test 3</div></div></div>'

    assert_equal expected, actual
  end

  test 'create card deck' do
    actual = ui_card_deck do |cg|
      cg.card 'test 1', body: true
      cg.card 'test 2', body: true
      cg.card 'test 3', body: true
    end
    expected = '<div class="card-deck-wrapper"><div class="card-deck"><div class="card"><div class="card-body">test 1</div></div><div class="card"><div class="card-body">test 2</div></div><div class="card"><div class="card-body">test 3</div></div></div></div>'

    assert_equal expected, actual
  end

  test 'create card column' do
    actual = ui_card_column do |cg|
      cg.card 'test 1', body: true
      cg.card 'test 2', body: true
      cg.card 'test 3', body: true
    end
    expected = '<div class="card-columns"><div class="card"><div class="card-body">test 1</div></div><div class="card"><div class="card-body">test 2</div></div><div class="card"><div class="card-body">test 3</div></div></div>'

    assert_equal expected, actual
  end

  test 'card list group' do
    actual = ui_card do |c|
      c.list_group do |lg|
        lg.list 'list 1'
        lg.list 'list 2'
        lg.list 'list 3'
      end
    end
    expected = '<div class="card"><ul class="list-group-flush list-group"><li class="list-group-item">list 1</li><li class="list-group-item">list 2</li><li class="list-group-item">list 3</li></ul></div>'

    assert_equal expected, actual
  end

  test 'card body parameters' do
    actual = ui_card do |c|
      c.body do |b|
        b.title 'title'
        b.text 'text'
        b.link 'link', url: '#'
      end
    end
    expected = '<div class="card"><div class="card-body"><h5 class="card-title">title</h5><p class="card-text">text</p><a class="card-link" href="#">link</a></div></div>'

    assert_equal expected, actual
  end

  test 'card tab' do
    actual = ui_card tabbed: true do |c|
      c.header do |h|
        h.tab_group do |cg|
          cg.tab 'link1', url: '#link1'
          cg.tab 'link2', url: '#link2'
        end
      end
      c.body tab_pan: "link1", state: :active
      c.body tab_pan: "link2"
    end
    expected = "<div class=\"card tab-content\"><div class=\"card-header\"><ul class=\"nav nav-tabs card-header-tabs\" role=\"tablist\"><li class=\"nav-item\"><a href=\"#link1\" class=\"nav-link\" data-bs-toggle=\"tab\" role=\"tab\">link1</a></li><li class=\"nav-item\"><a href=\"#link2\" class=\"nav-link\" data-bs-toggle=\"tab\" role=\"tab\">link2</a></li></ul></div><div class=\"active card-body\"></div><div class=\"card-body\"></div></div>"

    assert_equal expected, actual
  end

  test 'card row' do
    actual = ui_card do |c|
      c.row class: "g-0" do |r|
        r.col num: 4 do |col|
          col.image "https://picsum.photos/700/200", position: :left
        end
        r.col num: 8 do |col|
          col.body do |b|
            b.title "card title"
            b.subtitle "card subtitle"
            b.text "some quick example text to build on the card title and make up the bulk of the card's content."
          end
        end
      end
    end
    expected = "<div class=\"card\"><div class=\"g-0 row\"><div class=\"col-4\"><img class=\"card-img-left\" src=\"https://picsum.photos/700/200\" /></div><div class=\"col-8\"><div class=\"card-body\"><h5 class=\"card-title\">card title</h5><h6 class=\"card-subtitle mb-2 text-muted\">card subtitle</h6><p class=\"card-text\">some quick example text to build on the card title and make up the bulk of the card's content.</p></div></div></div></div>"

    assert_equal expected, actual
  end

  test "card with html" do
    actual = ui_card do |c|
      c.html "content"
      c.html do
        " content 2"
      end
    end

    expected = "<div class=\"card\">content content 2</div>"

    assert_equal expected, actual
  end
end
