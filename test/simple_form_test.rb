# encoding: UTF-8
require 'test_helper'
require 'simple_form'

include SimpleForm::ActionViewExtensions::FormHelper

include UiBibz::Helpers::UtilsHelper
class SimpleFormTest < ActionView::TestCase

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
      f.input :name_fr, as: :auto_complete_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group auto_complete_field optional user_name_fr\"><label class=\"control-label auto_complete_field optional\" for=\"user_name_fr\">Name fr</label><input type=\"text\" name=\"user[name_fr]\" id=\"user_name_fr\" value=\"test1\" class=\"auto_complete_field optional form-control auto-complete-field\" autocomplete=\"true\" list=\"user_name_fr-datalist\" /><datalist id=\"user_name_fr-datalist\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></datalist></div></form>"

    assert_equal expected, actual
  end

  test 'date picker field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :created_at, as: :date_picker_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group date_picker_field optional user_created_at\"><label class=\"control-label date_picker_field optional\" for=\"user_created_at\">Created at</label><input type=\"text\" name=\"user[created_at]\" id=\"user_created_at\" value=\"2017-04-26 14:48:43 UTC\" class=\"date_picker_field optional date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"yyyy-mm-dd\" data-date-today-btn=\"linked\" data-date-toggle-active=\"true\" /></div></form>"

    assert_equal expected, actual
  end

  test 'dropdown field select input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :dropdown_select_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group dropdown_select_field optional user_name_fr\"><label class=\"control-label dropdown_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"dropdown_select_field optional dropdown-select-field\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'dropdown field select input with grouped option in simple form' do

    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :dropdown_select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group dropdown_select_field optional user_name_fr\"><label class=\"control-label dropdown_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"dropdown_select_field optional dropdown-select-field\"><optgroup label=\"Europe\"><option value=\"1\">France</option>
<option value=\"2\">Deutchland</option></optgroup></select></div></form>"

    assert_equal expected, actual
  end

  test 'formula field input in simple form' do
    @user.price         = 3.0
    @user.price_formula = "1+2"

    actual = simple_form_for @user do |f|
      f.input :price, as: :formula_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group formula_field optional user_price\"><label class=\"control-label formula_field optional\" for=\"user_price\">Price</label><div class=\"formula_field input-group\"><input type=\"text\" name=\"user[price_formula]\" id=\"user_price_formula\" value=\"1+2\" class=\"formula_field optional formula-field form-control\" formula_field_value=\"1+2\" /><span class=\"formula-field-sign input-group-addon\">=</span><input type=\"text\" name=\"user[price]\" id=\"user_price\" value=\"3.0\" class=\"formula-field-result form-control\" readonly=\"readonly\" /><span data-toggle=\"tooltip\" class=\"formula-field-alert input-group-addon\"><i class=\"glyph-danger glyph fa fa-exclamation-triangle\"></i></span></div></div></form>"

    assert_equal expected, actual
  end

  test 'mardown editor field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :markdown_editor_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group markdown_editor_field optional user_name_fr\"><label class=\"control-label markdown_editor_field optional\" for=\"user_name_fr\">Name fr</label><textarea name=\"user[name_fr]\" id=\"user_name_fr\" class=\"markdown_editor_field optional\" data-provide=\"markdown\" data-iconlibrary=\"fa\">
</textarea></div></form>"

    assert_equal expected, actual
  end

  test 'multi column field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :multi_column_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group multi_column_field optional user_name_fr\"><label class=\"control-label multi_column_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr[]\" id=\"name_fr\" class=\"multi_column_field optional multi-column-field\" multiple=\"multiple\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'multi select field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :multi_select_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group multi_select_field optional user_name_fr\"><label class=\"control-label multi_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr[]\" id=\"name_fr\" class=\"multi_select_field optional btn-secondary multi-select-field\" multiple=\"multiple\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'multi select input with grouped option in simple form' do

    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :multi_select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group multi_select_field optional user_name_fr\"><label class=\"control-label multi_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr[]\" id=\"name_fr\" class=\"multi_select_field optional btn-secondary multi-select-field\" multiple=\"multiple\"><optgroup label=\"Europe\"><option value=\"1\">France</option>
<option value=\"2\">Deutchland</option></optgroup></select></div></form>"

    assert_equal expected, actual
  end

  test 'text field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :text_field
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group text_field optional user_name_fr\"><label class=\"control-label text_field optional\" for=\"user_name_fr\">Name fr</label><input type=\"text\" name=\"user[name_fr]\" id=\"user_name_fr\" value=\"test1\" class=\"text_field optional form-control\" /></div></form>"

    assert_equal expected, actual
  end

  test 'switch field input in simple form' do
    @user.active = true
    actual = simple_form_for @user do |f|
      f.input :active, as: :switch_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group switch_field optional user_active\"><label class=\"control-label switch_field optional\" for=\"user_active\">Active</label><div class=\"switch-field-container\"><input type=\"hidden\" name=\"user[active]\" id=\"user_active\" value=\"0\" /><input type=\"checkbox\" name=\"user[active]\" id=\"user_active\" value=\"1\" class=\"switch_field optional switch-field\" checked=\"checked\" /></div></div></form>"

    assert_equal expected, actual
  end

  test 'radio field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :radio_field, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group radio_field optional user_name_fr\"><label class=\"control-label radio_field optional\">Name fr</label><input type=\"hidden\" name=\"user[name_fr]\" value=\"\" /><div class=\"radio radio_field optional abc-radio-default radio abc-radio\"><input class=\"radio_field optional abc-radio-default radio abc-radio\" type=\"radio\" value=\"1\" name=\"user[name_fr]\" id=\"user_name_fr_1\" /><label class=\"collection_radio_buttons\" for=\"user_name_fr_1\">test1</label></div><div class=\"radio radio_field optional abc-radio-default radio abc-radio\"><input class=\"radio_field optional abc-radio-default radio abc-radio\" type=\"radio\" value=\"2\" name=\"user[name_fr]\" id=\"user_name_fr_2\" /><label class=\"collection_radio_buttons\" for=\"user_name_fr_2\">test2</label></div></div></form>"

    assert_equal expected, actual
  end

  test 'select field input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :select_field, collection: @users, label_method: :name_fr
    end

     expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group select_field optional user_name_fr\"><label class=\"control-label select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select_field optional select-field form-control\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'select field input with refresh button in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :select_field, refresh: { target: { data: [] }}, collection: @users, label_method: :name_fr
    end

     expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group select_field optional user_name_fr\"><label class=\"control-label select_field optional\" for=\"user_name_fr\">Name fr</label><div class=\"field-refresh input-group\"><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select_field optional select-field form-control\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select><div class=\"input-group-btn\"><span data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#user_name_fr&quot;,&quot;url&quot;:&quot;&quot;,&quot;data&quot;:[]}}\" class=\"btn-primary ui-bibz-connect btn input-refresh-button\"><i class=\"glyph fa fa-refresh\"></i> </span></div></div></div></form>"

    assert_equal expected, actual
  end

  test 'select input with grouped option in simple form' do

    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group select_field optional user_name_fr\"><label class=\"control-label select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select_field optional select-field form-control\"><optgroup label=\"Europe\"><option value=\"1\">France</option>
<option value=\"2\">Deutchland</option></optgroup></select></div></form>"

    assert_equal expected, actual
  end

  test 'test collection with selected option in select field into simple form' do

    @user.name_fr = 1
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :select_field, collection: @countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group select_field optional user_name_fr\"><label class=\"control-label select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select_field optional select-field form-control\"><option selected=\"selected\" value=\"1\">France</option>
<option value=\"2\">Deutchland</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'test collection with selected optiongroup in select field into simple form' do

    @user.name_fr = 1
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group select_field optional user_name_fr\"><label class=\"control-label select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"user[name_fr]\" id=\"user_name_fr\" class=\"select_field optional select-field form-control\"><optgroup label=\"Europe\"><option selected=\"selected\" value=\"1\">France</option>
<option value=\"2\">Deutchland</option></optgroup></select></div></form>"

    assert_equal expected, actual
  end

  test 'test surround field into simple form' do
    actual = ui_bibz_form_for @user do |f|
      concat(f.surround_field do |sf|
        sf.input :name_en, as: :text_field
        sf.addon("€")
      end)
      concat f.input(:name_fr, as: :auto_complete_field, collection: @users, label_method: :name_fr)
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div><div class=\"input-group\"><input type=\"text\" name=\"user[name_en]\" id=\"user_name_en\" value=\"test1 en\" class=\"text_field optional form-control\" /><span class=\"input-group-addon\">€</span></div></div><div class=\"form-group auto_complete_field optional user_name_fr\"><label class=\"control-label auto_complete_field optional\" for=\"user_name_fr\">Name fr</label><input type=\"text\" name=\"user[name_fr]\" id=\"user_name_fr\" value=\"test1\" class=\"auto_complete_field optional form-control auto-complete-field\" autocomplete=\"true\" list=\"user_name_fr-datalist\" /><datalist id=\"user_name_fr-datalist\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></datalist></div></form>"

    assert_equal expected, actual
  end
end

