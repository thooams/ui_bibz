# encoding: UTF-8
require 'test_helper'
require 'simple_form'

include SimpleForm::ActionViewExtensions::FormHelper

class SimpleFormTest < ActionView::TestCase

  setup do
    User.create(name_fr: 'test1')
    User.create(name_fr: 'test2')
    @users = User.all
    @user  = @users.first
  end

  test 'autocomplete input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :autocomplete, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group autocomplete optional user_name_fr\"><label class=\"control-label autocomplete optional\" for=\"user_name_fr\">Name fr</label><input class=\"autocomplete optional form-control\" autocomplete=\"true\" list=\"name_fr-datalist\" type=\"text\" value=\"test1\" name=\"user[name_fr]\" id=\"user_name_fr\" /><datalist id=\"name_fr-datalist\"><option value=\"test1\">test1</option>
<option value=\"test2\">test2</option></datalist></div></form>"

    assert_equal expected, actual
  end

  test 'date picker input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :date_picker
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group date_picker optional user_name_fr\"><label class=\"control-label date_picker optional\" for=\"user_name_fr\">Name fr</label><input class=\"date_picker optional date_picker form-control\" data-date-locale=\"en\" data-provide=\"datepicker\" data-date-format=\"dd/mm/yyyy\" data-date-today-btn=\"linked\" type=\"text\" value=\"test1\" name=\"user[name_fr]\" id=\"user_name_fr\" /></div></form>"

    assert_equal expected, actual
  end

  test 'dropdown select input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :dropdown_select, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group dropdown_select optional user_name_fr\"><label class=\"control-label dropdown_select optional\" for=\"user_name_fr\">Name fr</label><select class=\"dropdown_select optional selectpicker\" name=\"user[name_fr]\" id=\"user_name_fr\"><option value=\"\"></option>
<option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'formula input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :formula
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group formula optional user_name_fr\"><label class=\"control-label formula optional\" for=\"user_name_fr\">Name fr</label><div class=\"input-group formula_field\"><input class=\"formula optional formula_field_input form-control\" type=\"text\" name=\"user[name_fr_formula]\" id=\"user_name_fr_formula\" /><span class=\"formula_field_sign input-group-addon\">=</span><input readonly=\"readonly\" class=\"formula_field_result form-control\" type=\"text\" value=\"test1\" name=\"user[name_fr]\" id=\"user_name_fr\" /><span class=\"formula_field_alert input-group-addon\" data-toggle=\"tooltip\"><i class=\"glyph-danger glyph fa fa-exclamation-triangle\"></i></span></div></div></form>"

    assert_equal expected, actual
  end

  test 'mardown editor input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :markdown_editor
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group markdown_editor optional user_name_fr\"><label class=\"control-label markdown_editor optional\" for=\"user_name_fr\">Name fr</label><textarea class=\"markdown_editor optional\" data-provide=\"markdown\" data-iconlibrary=\"fa\" name=\"user[name_fr]\" id=\"user_name_fr\">
test1</textarea></div></form>"

    assert_equal expected, actual
  end

  test 'multi column input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :multi_column, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group multi_column optional user_name_fr\"><label class=\"control-label multi_column optional\" for=\"user_name_fr\">Name fr</label><input name=\"user[name_fr][]\" type=\"hidden\" value=\"\" /><select class=\"multi_column optional multi-column\" multiple=\"multiple\" name=\"user[name_fr][]\" id=\"user_name_fr\"><option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'multi select input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :multi_select, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group multi_select optional user_name_fr\"><label class=\"control-label multi_select optional\" for=\"user_name_fr\">Name fr</label><input name=\"user[name_fr][]\" type=\"hidden\" value=\"\" /><select class=\"multi_select optional btn-secondary btn multi-select\" multiple=\"multiple\" name=\"user[name_fr][]\" id=\"user_name_fr\"><option value=\"\"></option>
<option value=\"1\">test1</option>
<option value=\"2\">test2</option></select></div></form>"

    assert_equal expected, actual
  end

  test 'surround input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :surround
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group surround optional user_name_fr\"><label class=\"control-label surround optional\" for=\"user_name_fr\">Name fr</label><input class=\"surround optional form-control\" type=\"text\" value=\"test1\" name=\"user[name_fr]\" id=\"user_name_fr\" /></div></form>"

    assert_equal expected, actual
  end

  test 'switch input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :switch, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group switch optional user_name_fr\"><label class=\"control-label switch optional\" for=\"user_name_fr\">Name fr</label><input name=\"user[name_fr]\" type=\"hidden\" value=\"0\" /><input class=\"switch optional switch\" type=\"checkbox\" value=\"1\" name=\"user[name_fr]\" id=\"user_name_fr\" /></div></form>"

    assert_equal expected, actual
  end

  test 'radios input in simple form' do
    actual = simple_form_for @user do |f|
      f.input :name_fr, as: :radios, collection: @users, label_method: :name_fr
    end

    expected = "<form class=\"simple_form edit_user\" id=\"edit_user_1\" action=\"/users/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /><div class=\"form-group radios optional user_name_fr\"><label class=\"control-label radios optional\">Name fr</label><input type=\"hidden\" name=\"user[name_fr]\" value=\"\" /><div class=\"radio radios optional abc-radio-default radio abc-radio\"><input class=\"radios optional abc-radio-default radio abc-radio\" type=\"radio\" value=\"1\" name=\"user[name_fr]\" id=\"user_name_fr_1\" /><label class=\"collection_radio_buttons\" for=\"user_name_fr_1\">test1</label></div><div class=\"radio radios optional abc-radio-default radio abc-radio\"><input class=\"radios optional abc-radio-default radio abc-radio\" type=\"radio\" value=\"2\" name=\"user[name_fr]\" id=\"user_name_fr_2\" /><label class=\"collection_radio_buttons\" for=\"user_name_fr_2\">test2</label></div></div></form>"

    assert_equal expected, actual
  end
end

