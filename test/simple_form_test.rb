# encoding: UTF-8
require 'test_helper'
require 'simple_form'

include SimpleForm::ActionViewExtensions::FormHelper

class SimpleFormTest < ActionView::TestCase

  setup do
    User.where(name_fr: 'test1').first_or_create
    User.where(name_fr: 'test2').first_or_create
    continent = Continent.where(name: 'Europe').first_or_create
    Country.where(name: 'France', continent_id: continent.id).first_or_create
    Country.where(name: 'Deutchland', continent_id: continent.id).first_or_create

    @continents = Continent.all
    @countries  = Country.all
    @users      = User.all
    @user       = @users.first
  end

  # test 'auto complete field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :auto_complete_field, collection: @users, label_method: :name_fr
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group auto_complete_field optional user_name_fr\"><label class=\"control-label auto_complete_field optional\" for=\"user_name_fr\">Name fr</label><input class=\"auto_complete_field optional form-control\" autocomplete=\"true\" list=\"name_fr-datalist\" type=\"text\" value=\"test1\" name=\"user[name_fr]\" id=\"user_name_fr\" /><datalist id=\"name_fr-datalist\"><option value=\"test1\">test1</option>
#<o# ption value=\"test2\">test2</option></datalist></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'date picker field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :date_picker_field
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group date_picker_field optional user_name_fr\"><label class=\"control-label date_picker_field optional\" for=\"user_name_fr\">Name fr</label><input class=\"date_picker_field optional date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" type=\"text\" value=\"test1\" name=\"user[name_fr]\" id=\"user_name_fr\" /></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'dropdown field select input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :dropdown_select_field, collection: @users, label_method: :name_fr
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group dropdown_select_field optional user_name_fr\"><label class=\"control-label dropdown_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr\" id=\"name_fr\" class=\"dropdown_select_field optional dropdown-select-field\"><option value=\"\" label=\" \"></option><option value=\"1\">test1</option>
#<o# ption value=\"2\">test2</option></select></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'dropdown field select input with grouped option in simple form' do

  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :dropdown_select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group dropdown_select_field optional user_name_fr\"><label class=\"control-label dropdown_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr\" id=\"name_fr\" class=\"dropdown_select_field optional dropdown-select-field\"><option value=\"\" label=\" \"></option><optgroup label=\"Europe\"><option value=\"1\">France</option>
#<o# ption value=\"2\">Deutchland</option></optgroup></select></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'formula field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :formula_field
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group formula_field optional user_name_fr\"><label class=\"control-label formula_field optional\" for=\"user_name_fr\">Name fr</label><div class=\"input-group formula_field\"><input class=\"formula_field optional formula-field form-control\" type=\"text\" name=\"user[name_fr_formula]\" id=\"user_name_fr_formula\" /><span class=\"formula-field-sign input-group-addon\">=</span><input readonly=\"readonly\" class=\"formula-field-result form-control\" type=\"text\" value=\"test1\" name=\"user[name_fr]\" id=\"user_name_fr\" /><span class=\"formula-field-alert input-group-addon\" data-toggle=\"tooltip\"><i class=\"glyph-danger glyph fa fa-exclamation-triangle\"></i></span></div></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'mardown editor field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :markdown_editor_field
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group markdown_editor_field optional user_name_fr\"><label class=\"control-label markdown_editor_field optional\" for=\"user_name_fr\">Name fr</label><textarea class=\"markdown_editor_field optional\" data-provide=\"markdown\" data-iconlibrary=\"fa\" name=\"user[name_fr]\" id=\"user_name_fr\">
#te# st1</textarea></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'multi column field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :multi_column_field, collection: @users, label_method: :name_fr
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group multi_column_field optional user_name_fr\"><label class=\"control-label multi_column_field optional\" for=\"user_name_fr\">Name fr</label><input name=\"user[name_fr][]\" type=\"hidden\" value=\"\" /><select class=\"multi_column_field optional multi-column-field\" multiple=\"multiple\" name=\"user[name_fr][]\" id=\"user_name_fr\"><option value=\"1\">test1</option>
#<o# ption value=\"2\">test2</option></select></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'multi select field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :multi_select_field, collection: @users, label_method: :name_fr
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group multi_select_field optional user_name_fr\"><label class=\"control-label multi_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr[]\" id=\"name_fr\" class=\"multi_select_field optional btn-secondary multi-select-field\" multiple=\"multiple\"><option value=\"1\">test1</option>
#<o# ption value=\"2\">test2</option></select></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'multi select input with grouped option in simple form' do

  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :multi_select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group multi_select_field optional user_name_fr\"><label class=\"control-label multi_select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr[]\" id=\"name_fr\" class=\"multi_select_field optional btn-secondary multi-select-field\" multiple=\"multiple\"><optgroup label=\"Europe\"><option value=\"1\">France</option>
#<o# ption value=\"2\">Deutchland</option></optgroup></select></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'surround field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :surround_field
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group surround_field optional user_name_fr\"><label class=\"control-label surround_field optional\" for=\"user_name_fr\">Name fr</label><input class=\"surround_field optional form-control\" type=\"text\" value=\"test1\" name=\"user[name_fr]\" id=\"user_name_fr\" /></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'switch field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :switch_field, collection: @users, label_method: :name_fr
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group switch_field optional user_name_fr\"><label class=\"control-label switch_field optional\" for=\"user_name_fr\">Name fr</label><input name=\"user[name_fr]\" type=\"hidden\" value=\"0\" /><input class=\"switch_field optional switch-field\" type=\"checkbox\" value=\"1\" name=\"user[name_fr]\" id=\"user_name_fr\" /></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'radio field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :radio_field, collection: @users, label_method: :name_fr
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group radio_field optional user_name_fr\"><label class=\"control-label radio_field optional\">Name fr</label><input type=\"hidden\" name=\"user[name_fr]\" value=\"\" /><div class=\"radio radio_field optional abc-radio-default radio abc-radio\"><input class=\"radio_field optional abc-radio-default radio abc-radio\" type=\"radio\" value=\"1\" name=\"user[name_fr]\" id=\"user_name_fr_1\" /><label class=\"collection_radio_buttons\" for=\"user_name_fr_1\">test1</label></div><div class=\"radio radio_field optional abc-radio-default radio abc-radio\"><input class=\"radio_field optional abc-radio-default radio abc-radio\" type=\"radio\" value=\"2\" name=\"user[name_fr]\" id=\"user_name_fr_2\" /><label class=\"collection_radio_buttons\" for=\"user_name_fr_2\">test2</label></div></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'select field input in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :select_field, collection: @users, label_method: :name_fr
  #   end

  #    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group select_field optional user_name_fr\"><label class=\"control-label select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr\" id=\"name_fr\" class=\"select_field optional select-field form-control\"><option value=\"\" label=\" \"></option><option value=\"1\">test1</option>
#<o# ption value=\"2\">test2</option></select></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'select field input with refresh button in simple form' do
  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :select_field, refresh: { target: { data: [] }}, collection: @users, label_method: :name_fr
  #   end

  #    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group select_field optional user_name_fr\"><label class=\"control-label select_field optional\" for=\"user_name_fr\">Name fr</label><div class=\"input-group field-refresh\"><select name=\"name_fr\" id=\"name_fr\" class=\"select_field optional select-field form-control\"><option value=\"\" label=\" \"></option><option value=\"1\">test1</option>
#<o# ption value=\"2\">test2</option></select><span class=\"input-group-btn\"><button data-connect=\"{&quot;events&quot;:&quot;click&quot;,&quot;mode&quot;:&quot;remote&quot;,&quot;target&quot;:{&quot;selector&quot;:&quot;#name_fr&quot;,&quot;url&quot;:&quot;&quot;,&quot;data&quot;:[]}}\" class=\"btn-primary ui-bibz-connect input-refresh-button btn\"><i class=\"glyph fa fa-refresh\"></i> </button></span></div></div></form>"

  #   assert_equal expected, actual
  # end

  # test 'select input with grouped option in simple form' do

  #   actual = simple_form_for @user do |f|
  #     f.input :name_fr, as: :select_field, collection: @continents, toto: 'lala', grouped: true, group_method: :countries
  #   end

  #   expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group select_field optional user_name_fr\"><label class=\"control-label select_field optional\" for=\"user_name_fr\">Name fr</label><select name=\"name_fr\" id=\"name_fr\" class=\"select_field optional select-field form-control\"><option value=\"\" label=\" \"></option><optgroup label=\"Europe\"><option value=\"1\">France</option>
#<o# ption value=\"2\">Deutchland</option></optgroup></select></div></form>"

  #   assert_equal expected, actual
  # end

  test 'test collection with select field in simple form' do

    @user.name_fr = 1
    ap @user
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :select_field, collection: @countries
    end

    expected = ""

    assert_equal expected, actual
  end
end

