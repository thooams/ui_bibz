# frozen_string_literal: true

require 'test_helper'

class SurroundFieldTest < ActionView::TestCase
  test 'surround_field with glyph' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.glyph 'pencil'
    end.render
    expected = '<div class="input-group ui_surround_field"><span class="input-group-text"><i class="glyph fas fa-pencil"></i></span></div>'

    assert_equal expected, actual
  end

  test 'surround_field with addon' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.addon 'content addon'
    end.render
    expected = '<div class="input-group ui_surround_field"><span class="input-group-text">content addon</span></div>'

    assert_equal expected, actual
  end

  test 'surround_field with dropdown' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.dropdown 'Dropdown', {}, { id: 'dropdown-test' } do |d|
        d.link 'Link 1', url: '#link1', glyph: 'eye'
        d.header 'header'
        d.link 'Link 2', url: '#link2'
        d.divider
        d.link 'Link3', url: '#link3'
      end
    end.render
    expected = "<div class=\"input-group ui_surround_field\"><button class=\"btn btn-secondary dropdown-toggle\" type=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\" id=\"dropdown-test\">Dropdown</button><div class=\"dropdown-menu\" arial-labelledby=\"dropdown-test\"><a class=\"dropdown-item\" href=\"#link1\"><i class=\"glyph fas fa-eye\"></i> Link 1</a><h6 class=\"dropdown-header\" role=\"presentation\">header</h6><a class=\"dropdown-item\" href=\"#link2\">Link 2</a><div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"#link3\">Link3</a></div></div>"

    assert_equal expected, actual
  end

  test 'surround_field with button' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.button 'Submit'
    end.render
    expected = "<div class=\"input-group ui_surround_field\"><button class=\"btn-secondary btn\">Submit</button></div>"

    assert_equal expected, actual
  end

  test 'surround_field with button, addon, glyph' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.button 'Submit'
      sf.addon '€'
      sf.glyph 'pencil'
    end.render
    expected = "<div class=\"input-group ui_surround_field\"><button class=\"btn-secondary btn\">Submit</button><span class=\"input-group-text\">€</span><span class=\"input-group-text\"><i class=\"glyph fas fa-pencil\"></i></span></div>"

    assert_equal expected, actual
  end

  test 'surround_field with html' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.html 'Content'
      sf.html do
        " Content 2"
      end
    end.render
    expected = "<div class=\"input-group ui_surround_field\">Content Content 2</div>"

    assert_equal expected, actual
  end

  test "surround with all fields" do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.glyph 'gem'
      sf.addon "test"
      sf.button "button"
      sf.button_group do |bg|
        bg.button "test"
      end
      sf.button_link "link", url: "#"
      sf.checkbox_field :check
      sf.radio_field :radio
      sf.text_field :text
      sf.date_picker_field :date
      sf.dropdown_select_field :dropdown_select
      sf.select_field :select
      sf.auto_complete_field :auto
      sf.button_refresh
    end.render

    expected = "<div class=\"input-group ui_surround_field\"><span class=\"input-group-text\"><i class=\"glyph fas fa-gem\"></i></span><span class=\"input-group-text\">test</span><button class=\"btn-secondary btn\">button</button><div class=\"input-group-btn\" role=\"group\"><button class=\"btn-secondary btn\">test</button></div><a class=\"btn-secondary btn\" role=\"button\" href=\"#\">link</a><div class=\"input-group-text\" label=\"false\"><input type=\"checkbox\" name=\"check\" id=\"check\" value=\"1\" class=\"form-check-input\" /><label class=\"form-check-label\" for=\"check\">check</label></div><div class=\"input-group-text\" label=\"false\"><input type=\"radio\" name=\"radio\" id=\"radio_\" class=\"form-check-input\" /><label class=\"form-check-label\" for=\"radio_\">radio</label></div><input type=\"text\" name=\"text\" id=\"text\" class=\"form-control\" /><input type=\"text\" name=\"date\" id=\"date\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"yyyy-mm-dd\" data-date-today-btn=\"linked\" data-date-toggle-active=\"true\" class=\"date_picker form-control\" /><select name=\"dropdown_select\" id=\"dropdown_select\" data-wrapper-classes=\"input-group-btn\" data-dropdown-classes=\"dropdown\" class=\"btn-secondary multi-select-field\"></select><select name=\"select\" id=\"select\" class=\"select-field form-control form-select\"></select><input type=\"text\" name=\"auto\" id=\"auto\" class=\"form-control auto-complete-field\" autocomplete=\"true\" list=\"auto-datalist\" /><datalist id=\"auto-datalist\"></datalist><span data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;&quot;,&quot;url&quot;:&quot;&quot;,&quot;data&quot;:[]}}\" class=\"btn-secondary ui-bibz-connect btn input-refresh-button\"><i class=\"glyph fas fa-sync-alt\"></i></span></div>"

    assert_equal expected, actual
  end
end
