 require 'test_helper'

class CardTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::UxHelper

  test 'create panel' do
    actual = ui_panel do |p|
      p.header tap: true do |h|
        h.title 'My header'
        h.actions size: :sm, outline: true, status: :secondary do |a|
          a.button 'Minimize', glyph: 'caret-up', text: false
          a.button 'Options', glyph: 'cog', text: false
          a.button 'Close', glyph: 'Close', text: false
        end
      end
      p.toolbar justify: true, size: :sm do |t|
        t.button_group do |bg|
          bg.button 'Copy'
          bg.button 'Cut'
          bg.button 'Paste'
        end
        t.spacer 2
        t.button_group do |bg|
          bg.button 'Delete'
        end
      end
      p.body 'Body'
      p.toolbar size: :sm do |t|
        t.button_group size: :sm do |bg|
          bg.button 'Add', glyph: 'plus-circle', status: :success, text: false
          bg.button 'Remove', glyph: 'minus-circle', status: :danger, text: false
        end
      end
      p.footer 'Footer'
    end
    expected = "<div class=\"panel\"><div class=\"panel-header justify-content-between\"><div class=\"panel-title\">My header</div><div class=\"btn-group btn-group-sm\" role=\"group\"><button class=\"btn-outline-secondary btn btn-sm without-text\"><i title=\"Minimize\" class=\"glyph fas fa-caret-up\"></i></button><button class=\"btn-outline-secondary btn btn-sm without-text\"><i title=\"Options\" class=\"glyph fas fa-cog\"></i></button><button class=\"btn-outline-secondary btn btn-sm without-text\"><i title=\"Close\" class=\"glyph fas fa-Close\"></i></button></div></div><div class=\"btn-toolbar justify-content-between panel-toolbar\" role=\"toolbar\"><div class=\"btn-group btn-group-sm mr-2\" role=\"group\"><button class=\"btn btn-sm\">Copy</button><button class=\"btn btn-sm\">Cut</button><button class=\"btn btn-sm\">Paste</button></div><div class=\"btn-group btn-group-sm\" role=\"group\"><button class=\"btn btn-sm\">Delete</button></div></div><div class=\"panel-body\">Body</div><div class=\"btn-toolbar panel-toolbar\" role=\"toolbar\"><div class=\"btn-group btn-group-sm\" role=\"group\"><button class=\"btn-success btn btn-sm without-text\"><i title=\"Add\" class=\"glyph fas fa-plus-circle\"></i></button><button class=\"btn-danger btn btn-sm without-text\"><i title=\"Remove\" class=\"glyph fas fa-minus-circle\"></i></button></div></div><div class=\"panel-footer\">Footer</div></div>"

    assert_equal expected, actual
  end

  test 'panel with group' do
    actual = ui_panel do |p|
      p.header tap: true do |h|
        h.title 'Main panel header'
      end
      p.toolbar justify: true, size: :sm do |t|
        t.button_group do |bg|
          bg.button 'Copy'
          bg.button 'Cut'
          bg.button 'Paste'
        end
        t.spacer 2
        t.button_group do |bg|
          bg.button 'Delete'
        end
      end
      p.group do |d|
        d.panel do |b|
          b.header 'Left Panel Header'
          b.body 'Left Panel Body'
          b.footer 'Left Panel Footer'
        end
        d.panel do |b|
          b.header 'Right Panel Header'
          b.body 'Right Panel Body'
        end
      end
      p.footer 'Main Panel Footer'
    end
    expected = "<div class=\"panel\"><div class=\"panel-header justify-content-between\"><div class=\"panel-title\">Main panel header</div></div><div class=\"btn-toolbar justify-content-between panel-toolbar\" role=\"toolbar\"><div class=\"btn-group btn-group-sm mr-2\" role=\"group\"><button class=\"btn btn-sm\">Copy</button><button class=\"btn btn-sm\">Cut</button><button class=\"btn btn-sm\">Paste</button></div><div class=\"btn-group btn-group-sm\" role=\"group\"><button class=\"btn btn-sm\">Delete</button></div></div><div class=\"panel-group\"><div class=\"panel\"><div class=\"panel-header justify-content-between\">Left Panel Header</div><div class=\"panel-body\">Left Panel Body</div><div class=\"panel-footer\">Left Panel Footer</div></div><div class=\"panel\"><div class=\"panel-header justify-content-between\">Right Panel Header</div><div class=\"panel-body\">Right Panel Body</div></div></div><div class=\"panel-footer\">Main Panel Footer</div></div>"

    assert_equal expected, actual
  end

  test 'panel with deck' do
    actual = ui_panel do |p|
      p.header tap: true do |h|
        h.title 'Main panel header'
      end
      p.toolbar justify: true, size: :sm do |t|
        t.button_group do |bg|
          bg.button 'Copy'
          bg.button 'Cut'
          bg.button 'Paste'
        end
        t.spacer 2
        t.button_group do |bg|
          bg.button 'Delete'
        end
      end
      p.deck do |d|
        d.panel do |b|
          b.header 'Left Panel Header'
          b.body 'Left Panel Body'
          b.footer 'Left Panel Footer'
        end
        d.panel do |b|
          b.header 'Right Panel Header'
          b.body 'Right Panel Body'
        end
      end
      p.footer 'Main Panel Footer'
    end
    expected = "<div class=\"panel\"><div class=\"panel-header justify-content-between\"><div class=\"panel-title\">Main panel header</div></div><div class=\"btn-toolbar justify-content-between panel-toolbar\" role=\"toolbar\"><div class=\"btn-group btn-group-sm mr-2\" role=\"group\"><button class=\"btn btn-sm\">Copy</button><button class=\"btn btn-sm\">Cut</button><button class=\"btn btn-sm\">Paste</button></div><div class=\"btn-group btn-group-sm\" role=\"group\"><button class=\"btn btn-sm\">Delete</button></div></div><div class=\"panel-deck-wrapper\"><div class=\"panel-deck\"><div class=\"panel\"><div class=\"panel-header justify-content-between\">Left Panel Header</div><div class=\"panel-body\">Left Panel Body</div><div class=\"panel-footer\">Left Panel Footer</div></div><div class=\"panel\"><div class=\"panel-header justify-content-between\">Right Panel Header</div><div class=\"panel-body\">Right Panel Body</div></div></div></div><div class=\"panel-footer\">Main Panel Footer</div></div>"

    assert_equal expected, actual
  end

  test 'panel with column' do
    actual = ui_panel do |p|
      p.header tap: true do |h|
        h.title 'Main panel header'
      end
      p.toolbar justify: true, size: :sm do |t|
        t.button_group do |bg|
          bg.button 'Copy'
          bg.button 'Cut'
          bg.button 'Paste'
        end
        t.spacer 2
        t.button_group do |bg|
          bg.button 'Delete'
        end
      end
      p.column do |d|
        d.panel do |b|
          b.header 'Left Panel Header'
          b.body 'Left Panel Body'
          b.footer 'Left Panel Footer'
        end
        d.panel do |b|
          b.header 'Right Panel Header'
          b.body 'Right Panel Body'
        end
      end
      p.footer 'Main Panel Footer'
    end
    expected = "<div class=\"panel\"><div class=\"panel-header justify-content-between\"><div class=\"panel-title\">Main panel header</div></div><div class=\"btn-toolbar justify-content-between panel-toolbar\" role=\"toolbar\"><div class=\"btn-group btn-group-sm mr-2\" role=\"group\"><button class=\"btn btn-sm\">Copy</button><button class=\"btn btn-sm\">Cut</button><button class=\"btn btn-sm\">Paste</button></div><div class=\"btn-group btn-group-sm\" role=\"group\"><button class=\"btn btn-sm\">Delete</button></div></div><div class=\"panel-columns\"><div class=\"panel\"><div class=\"panel-header justify-content-between\">Left Panel Header</div><div class=\"panel-body\">Left Panel Body</div><div class=\"panel-footer\">Left Panel Footer</div></div><div class=\"panel\"><div class=\"panel-header justify-content-between\">Right Panel Header</div><div class=\"panel-body\">Right Panel Body</div></div></div><div class=\"panel-footer\">Main Panel Footer</div></div>"

    assert_equal expected, actual
  end

end
