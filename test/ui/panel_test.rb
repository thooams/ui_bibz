require 'test_helper'
include UiBibz::Helpers
class PanelTest < ActionView::TestCase

  setup do
    @content = 'Example'

  end

  test 'simple panel' do
    actual   = UiBibz::Ui::Panel.new(@content).render
    expected = "<div class=\"panel-default panel\"><div class=\"panel-body\">#{ @content }</div></div>"

    assert_equal actual, expected
  end

  test 'simple panel with block' do
    actual = UiBibz::Ui::Panel.new do
      @content
    end.render
    expected = "<div class=\"panel-default panel\"><div class=\"panel-body\">#{ @content }</div></div>"

    assert_equal actual, expected
  end

  test 'simple panel with tap' do
    actual = UiBibz::Ui::Panel.new().tap do |p|
      p.body @content
    end.render
    expected = "<div class=\"panel-default panel\"><div class=\"panel-body\">#{ @content }</div></div>"

    assert_equal actual, expected
  end

  test 'complex panel with tap' do
    actual = UiBibz::Ui::Panel.new({state: :danger}, { class: 'example'}).tap do |p|
      p.header 'header', class: 'header-example'
      p.body class: 'body-example' do
        @content
      end
      p.footer do
        "footer"
      end
    end.render
    expected = "<div class=\"example panel-danger panel\">\
<div class=\"header-example panel-heading\">header</div>\
<div class=\"body-example panel-body\">#{ @content }</div>\
<div class=\"panel-footer\">footer</div></div>"

    assert_equal actual, expected
  end

end
