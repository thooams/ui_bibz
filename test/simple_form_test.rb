# encoding: UTF-8
require 'test_helper'

class SimpleFormTest < ActionView::TestCase

  include SimpleForm::ActionViewExtensions::FormHelper
  include UiBibz::Helpers::UtilsHelper

  setup do
    user = User.where(name_fr: 'test1', name_en: 'test1 en', active: true).first_or_create
    user.update_attribute(:created_at, "2017-04-26 14:48:43 UTC")
    user = User.where(name_fr: 'test2', name_en: 'test2 en', active: false).first_or_create
    user.update_attribute(:created_at, "2017-04-26 14:48:43 UTC")
    continent = Continent.where(name: 'Europe').first_or_create
    Country.where(name: 'France', continent_id: continent.id).first_or_create
    Country.where(name: 'Deutchland', continent_id: continent.id).first_or_create

    @continents = Continent.all
    @countries  = Country.all
    @users      = User.all
    @user       = @users.first
  end

  test 'auto complete field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_auto_complete_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_auto_complete_field optional user_name_fr\"><label class=\"control-label ui_auto_complete_field optional\" for=\"user_name_fr\">Name fr</label><input type=\"text\" name=\"user[name_fr]\" id=\"user_name_fr\" value=\"test1\" class=\"form-control auto-complete-field\" autocomplete=\"true\" list=\"user_name_fr-datalist\" /><datalist id=\"user_name_fr-datalist\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></datalist></div></form>"

    assert_equal expected, actual
  end

  test 'date picker field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :created_at, as: :ui_date_picker_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_date_picker_field optional user_created_at\"><label class=\"control-label ui_date_picker_field optional\" for=\"user_created_at\">Created at</label><input type=\"text\" name=\"user[created_at]\" id=\"user_created_at\" value=\"2017-04-26 14:48:43 UTC\" class=\"ui_date_picker_field optional date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"yyyy-mm-dd\" data-date-today-btn=\"linked\" data-date-toggle-active=\"true\" /></div></form>"

    assert_equal expected, actual
  end

  test 'dropdown field select input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_dropdown_select_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_dropdown_select_field optional user_name_fr\"><label class=\"control-label ui_dropdown_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"dropdown-select-field\" data-style=\"btn-secondary\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'dropdown field select input with grouped option in simple form' do

    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_dropdown_select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_dropdown_select_field optional user_name_fr\"><label class=\"control-label ui_dropdown_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"dropdown-select-field\" data-style=\"btn-secondary\"><optgroup label=\"Europe\"><option value=\"1\">France</option>
<option value=\"2\">Deutchland</option></optgroup></select></div></form>"

    assert_equal expected, actual
  end

  test 'formula field input in simple form' do
    @user.price         = 3.0
    @user.price_formula = "1+2"

    actual = simple_form_for @user do |f|
      f.input :price, as: :ui_formula_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_formula_field optional user_price\"><label class=\"control-label ui_formula_field optional\" for=\"user_price\">Price</label><div class=\"formula_field input-group ui_surround_field\"><input type=\"text\" name=\"user[price_formula]\" id=\"user_price_formula\" value=\"1+2\" class=\"ui_formula_field optional formula-field form-control\" formula_field_value=\"1+2\" /><span class=\"formula-field-sign input-group-addon\">=</span><input type=\"text\" name=\"user[price]\" id=\"user_price\" value=\"3.0\" class=\"formula-field-result form-control\" readonly=\"readonly\" /><span data-toggle=\"tooltip\" class=\"formula-field-alert input-group-addon\"><i class=\"glyph-danger glyph fas fa-exclamation-triangle\"></i></span></div></div></form>"

    assert_equal expected, actual
  end

  test 'mardown editor field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_markdown_editor_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_markdown_editor_field optional user_name_fr\"><label class=\"control-label ui_markdown_editor_field optional\" for=\"user_name_fr\">Name fr</label><textarea name=\"user[name_fr]\" id=\"user_name_fr\" class=\"ui_markdown_editor_field optional\" data-provide=\"markdown\" data-iconlibrary=\"fa-5\">
test1</textarea></div></form>"

    assert_equal expected, actual
  end

  test 'multi column field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_multi_column_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_multi_column_field optional user_name_fr\"><label class=\"control-label ui_multi_column_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr[]\" id=\"name_fr\" class=\"multi-column-field\" multiple=\"multiple\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'multi select field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_multi_select_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_multi_select_field optional user_name_fr\"><label class=\"control-label ui_multi_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr][]\" id=\"user_name_fr\" class=\"btn-secondary multi-select-field\" multiple=\"multiple\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'multi select input with grouped option in simple form' do

    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_multi_select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_multi_select_field optional user_name_fr\"><label class=\"control-label ui_multi_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr][]\" id=\"user_name_fr\" class=\"btn-secondary multi-select-field\" multiple=\"multiple\"><optgroup label=\"Europe\"><option value=\"1\">France</option>
<option value=\"2\">Deutchland</option></optgroup></select></div></form>"

    assert_equal expected, actual
  end

  test 'text field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_text_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_text_field optional user_name_fr\"><label class=\"control-label ui_text_field optional\" for=\"user_name_fr\">Name fr</label><input type=\"text\" name=\"user[name_fr]\" id=\"user_name_fr\" value=\"test1\" class=\"ui_text_field optional form-control\" /></div></form>"

    assert_equal expected, actual
  end

  test 'switch field input in simple form' do
    @user.active = true
    actual = simple_form_for @user do |f|
      f.input :active, as: :ui_box_switch_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_box_switch_field optional user_active\"><label class=\"control-label ui_box_switch_field optional\" for=\"user_active\">Active</label><div class=\"switch-field-container\"><input type=\"hidden\" name=\"user[active]\" id=\"user_active\" value=\"0\" /><input type=\"checkbox\" name=\"user[active]\" id=\"user_active\" value=\"1\" class=\"ui_box_switch_field optional switch-field\" checked=\"checked\" /></div></div></form>"

    assert_equal expected, actual
  end

  test 'radio field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_radio_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_radio_field optional user_name_fr\"><label class=\"control-label ui_radio_field optional\">Name fr</label><input type=\"hidden\" name=\"user[name_fr]\" value=\"\" /><div class=\"radio ui_radio_field optional custom-control custom-radio\"><input class=\"ui_radio_field optional custom-control custom-radio\" type=\"radio\" value=\"1\" name=\"user[name_fr]\" id=\"user_name_fr_1\" /><label class=\"collection_radio_buttons\" for=\"user_name_fr_1\">test1</label></div><div class=\"radio ui_radio_field optional custom-control custom-radio\"><input class=\"ui_radio_field optional custom-control custom-radio\" type=\"radio\" value=\"2\" name=\"user[name_fr]\" id=\"user_name_fr_2\" /><label class=\"collection_radio_buttons\" for=\"user_name_fr_2\">test2</label></div></div></form>"

    assert_equal expected, actual
  end

  test 'select field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_select_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_select_field optional user_name_fr\"><label class=\"control-label ui_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select-field form-control custom-select\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'select field input with refresh button in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_select_field, refresh: { target: { data: [] }}, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_select_field optional user_name_fr\"><label class=\"control-label ui_select_field optional\" for=\"user_name_fr\">Name fr</label><div class=\"field-refresh input-group ui_surround_field\"><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select-field form-control custom-select\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select><div class=\"input-group-btn\"><span data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#user_name_fr&quot;,&quot;url&quot;:&quot;&quot;,&quot;data&quot;:[]}}\" class=\"btn-secondary ui-bibz-connect btn input-refresh-button\"><i class=\"glyph fas fa-sync-alt\"></i> </span></div></div></div></form>"

    assert_equal expected, actual
  end

  test 'select input with grouped option in simple form' do

    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_select_field optional user_name_fr\"><label class=\"control-label ui_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select-field form-control custom-select\"><optgroup label=\"Europe\"><option value=\"1\">France</option>
<option value=\"2\">Deutchland</option></optgroup></select></div></form>"

    assert_equal expected, actual
  end

  test 'test collection with selected option in select field into simple form' do

    @user.name_fr = 1
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_select_field, collection: @countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_select_field optional user_name_fr\"><label class=\"control-label ui_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select-field form-control custom-select\"><option selected=\"selected\" value=\"1\">France</option>
<option value=\"2\">Deutchland</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'test collection with selected optiongroup in select field into simple form' do

    @user.name_fr = 1
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_select_field optional user_name_fr\"><label class=\"control-label ui_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select-field form-control custom-select\"><optgroup label=\"Europe\"><option selected=\"selected\" value=\"1\">France</option>
<option value=\"2\">Deutchland</option></optgroup></select></div></form>"

    assert_equal expected, actual
  end

  test 'number field' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_number_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_number_field optional user_name_fr\"><label class=\"control-label ui_number_field optional\" for=\"user_name_fr\">Name fr</label><input type=\"number\" name=\"user[name_fr]\" id=\"user_name_fr\" value=\"test1\" class=\"ui_number_field optional form-control\" /></div></form>"

    assert_equal expected, actual
  end

  test 'file field' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_file_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_file_field optional user_name_fr\"><label class=\"control-label ui_file_field optional\" for=\"user_name_fr\">Name fr</label><div class=\"ui_file_field optional custom-file\"><input type=\"file\" name=\"user[name_fr]\" id=\"user_name_fr\" class=\"custom-file-input\" /><label class=\"custom-file-label\" for=\"user_name_fr\">test1</label></div></div></form>"

    assert_equal expected, actual
  end

  test 'range field' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :ui_range_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group ui_range_field optional user_name_fr\"><label class=\"control-label ui_range_field optional\" for=\"user_name_fr\">Name fr</label><input type=\"range\" name=\"user[name_fr]\" id=\"user_name_fr\" value=\"test1\" class=\"ui_range_field optional custom-range\" /></div></form>"

    assert_equal expected, actual
  end

#   test 'test surround field into simple form' do
#     actual = ui_form_for @user do |f|
#       concat(f.ui_surround_field do |sf|
#         sf.input :name_en, as: :text_field
#         sf.addon("€")
#       end)
#       concat f.input(:name_fr, as: :ui_auto_complete_field, collection: @users, label_method: :name_fr)
#     end
#
#     expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div><div class=\"input-group\"><input type=\"text\" name=\"user[name_en]\" id=\"user_name_en\" value=\"test1 en\" class=\"text_field optional form-control\" /><span class=\"input-group-addon\">€</span></div></div><div class=\"form-group ui_auto_complete_field optional user_name_fr\"><label class=\"control-label ui_auto_complete_field optional\" for=\"user_name_fr\">Name fr</label><input type=\"text\" name=\"user[name_fr]\" id=\"user_name_fr\" value=\"test1\" class=\"ui_auto_complete_field optional form-control auto-complete-field\" autocomplete=\"true\" list=\"user_name_fr-datalist\" /><datalist id=\"user_name_fr-datalist\"><option value=\"1\">test1</option>
# <option value=\"2\">test2</option></datalist></div></form>"
#
#     assert_equal expected, actual
#   end
end

