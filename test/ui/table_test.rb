require 'test_helper'
require "ui_bibz/ui/ux/table/components/store"
require "ui_bibz/ui/ux/table/extensions/paginable"
require "ui_bibz/ui/ux/table/extensions/searchable"
require "ui_bibz/ui/ux/table/extensions/sortable"
require "ui_bibz/ui/ux/table/extensions/actionable"
include UiBibz::Helpers
class TableTest < ActionView::TestCase

  setup do
    create_list(:user, 25)
    params = {
      controller: 'users',
      action:     'index',
      sort:       'users.name_fr',
      direction:  'asc',
      search:     'Name fr',
      per_page:   2,
      page:       1
    }
    @users  = User.table_search_pagination(params, session)
    @store = UiBibz::Ui::Ux::Store.new @users
  end

  test 'table search field' do
    actual   = UiBibz::Ui::Ux::TableSearchField.new({ store: @users}).render
    expected = "<form class=\"form-table-search-field\" action=\"/users?direction=asc&amp;page=1&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><div class=\"input-group input-group-sm table-search-field\"><span class=\"input-group-addon\"><i class=\"glyph fa fa-search\"></i></span><input type=\"hidden\" name=\"controller\" value=\"users\" /><input type=\"hidden\" name=\"action\" value=\"index\" /><input type=\"hidden\" name=\"sort\" value=\"users.name_fr\" /><input type=\"hidden\" name=\"direction\" value=\"asc\" /><input type=\"hidden\" name=\"search\" value=\"Name fr\" /><input type=\"hidden\" name=\"per_page\" value=\"2\" /><input type=\"hidden\" name=\"page\" value=\"1\" /><input type=\"search\" value=\"Name fr\" name=\"search\" class=\"form-control\" placeholder=\"Search by Name fr and Name en...\" /><span class=\"input-group-btn\"><button type=\"button\" class=\"btn btn-secondary\"><i class=\"glyph fa fa-times-circle\"></i></button></span></div></form>"

    assert_equal expected, actual
  end

  test 'table pagination' do
    actual = UiBibz::Ui::Ux::TablePagination.new({ store: @users }).render
    expected = "<ul class=\"pagination pagination\"><li class=\"prev disabled\"><span>&#8592; Previous</span></li> <li class=\"active\"><span>1</span></li> <li><a rel=\"next\" href=\"/users?direction=asc&amp;page=2&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">2</a></li> <li><a href=\"/users?direction=asc&amp;page=3&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">3</a></li> <li><a href=\"/users?direction=asc&amp;page=4&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">4</a></li> <li><a href=\"/users?direction=asc&amp;page=5&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">5</a></li> <li><a href=\"/users?direction=asc&amp;page=6&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">6</a></li> <li><a href=\"/users?direction=asc&amp;page=7&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">7</a></li> <li><a href=\"/users?direction=asc&amp;page=8&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">8</a></li> <li><a href=\"/users?direction=asc&amp;page=9&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">9</a></li> <li class=\"disabled\"><span>&hellip;</span></li> <li><a href=\"/users?direction=asc&amp;page=12&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">12</a></li> <li><a href=\"/users?direction=asc&amp;page=13&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">13</a></li> <li class=\"next\"><a rel=\"next\" href=\"/users?direction=asc&amp;page=2&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">Next &#8594;</a></li></ul>"

    assert_equal expected, actual
  end

  test 'table non sortable' do
    options  = { sortable: false }
    actual   = UiBibz::Ui::Ux::Sortable.new(@store, options).header(@store.columns.list.first)
    expected = "Id"

    assert_equal expected, actual
  end

  test 'table sortable' do
    options  = { sortable: true }
    actual   = UiBibz::Ui::Ux::Sortable.new(@store, options).header(@store.columns.list.first)
    expected = "<a class=\"dropup\" href=\"/users?column_id=id&amp;direction=asc&amp;search=Name+fr&amp;sort=users.id\">Id</a>"

    assert_equal expected, actual
  end

  test 'table non paginable' do
    options      = { paginable: false }
    pagination   = UiBibz::Ui::Ux::Paginable.new(@store, options)
    actual       = pagination.render if pagination.paginable?
    expected     = nil

    assert_equal expected, actual
  end

  test 'table paginable' do
    options      = { paginable: true }
    pagination   = UiBibz::Ui::Ux::Paginable.new(@store, options)
    actual       = pagination.render if pagination.paginable?
    expected     = "<div><ul class=\"pagination pagination\"><li class=\"prev disabled\"><span>&#8592; Previous</span></li> <li class=\"active\"><span>1</span></li> <li><a rel=\"next\" href=\"/users?direction=asc&amp;page=2&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">2</a></li> <li><a href=\"/users?direction=asc&amp;page=3&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">3</a></li> <li><a href=\"/users?direction=asc&amp;page=4&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">4</a></li> <li><a href=\"/users?direction=asc&amp;page=5&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">5</a></li> <li><a href=\"/users?direction=asc&amp;page=6&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">6</a></li> <li><a href=\"/users?direction=asc&amp;page=7&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">7</a></li> <li><a href=\"/users?direction=asc&amp;page=8&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">8</a></li> <li><a href=\"/users?direction=asc&amp;page=9&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">9</a></li> <li class=\"disabled\"><span>&hellip;</span></li> <li><a href=\"/users?direction=asc&amp;page=12&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">12</a></li> <li><a href=\"/users?direction=asc&amp;page=13&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">13</a></li> <li class=\"next\"><a rel=\"next\" href=\"/users?direction=asc&amp;page=2&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\">Next &#8594;</a></li></ul><form action=\"/users\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><div class=\"table-pagination-per-page\">Displaying User <b>1&nbsp;-&nbsp;2</b> of <b>25</b> in total | Per page: <input type=\"hidden\" name=\"controller\" value=\"users\" /><input type=\"hidden\" name=\"action\" value=\"index\" /><input type=\"hidden\" name=\"sort\" value=\"users.name_fr\" /><input type=\"hidden\" name=\"direction\" value=\"asc\" /><input type=\"hidden\" name=\"search\" value=\"Name fr\" /><input type=\"hidden\" name=\"per_page\" value=\"2\" /><input type=\"hidden\" name=\"page\" value=\"1\" /><select name=\"per_page\" id=\"per_page\" class=\"form-control\"><option value=\"5\">5</option>
<option value=\"10\">10</option>
<option value=\"20\">20</option>
<option value=\"30\">30</option>
<option value=\"50\">50</option>
<option value=\"100\">100</option>
<option value=\"200\">200</option>
<option value=\"500\">500</option></select></div></form><br class=\"ui-bibz-clear\" /></div>"

    assert_equal expected, actual
  end

  test 'table non searchable' do
    options  = { searchable: false }
    actual   = UiBibz::Ui::Ux::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\">Users list</div><br class=\"ui-bibz-clear\" /></div>"

    assert_equal expected, actual
  end

  test 'table non searchable with a title and glyph' do
    options  = { searchable: false, glyph: 'toto', title: 'Title list' }
    actual   = UiBibz::Ui::Ux::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\"><i class=\"glyph fa fa-toto\"></i>Title list</div><br class=\"ui-bibz-clear\" /></div>"

    assert_equal expected, actual
  end

  test 'table searchable' do
    options  = { searchable: true }
    actual   = UiBibz::Ui::Ux::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\">Users list</div><div class=\"input-group input-group-sm table-search-field\"><span class=\"input-group-addon\"><i class=\"glyph fa fa-search\"></i></span><input type=\"search\" value=\"Name fr\" name=\"search\" class=\"form-control\" placeholder=\"Search by Name fr and Name en...\" /><span class=\"clear-search-btn input-group-addon\"><i class=\"glyph fa fa-times-circle\"></i></span></div><br class=\"ui-bibz-clear\" /></div>"

    assert_equal expected, actual
  end

  test 'table actionable header' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Ux::Actionable.new(@store, options)
    actual   = action.header []
    expected = ["<th class=\"action\"></th>"]

    assert_equal expected, actual
  end

  test 'table actionable body' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Ux::Actionable.new(@store, options)
    actual   = action.body @store.records.first, []
    expected = ["<td></td>"]

    assert_equal expected, actual
  end

  test 'table actionable inject_url' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Ux::Actionable.new(@store, options)
    actual   = action.inject_url 'http://localhost/users/id/test', @store.records.first
    expected = "http://localhost/users/1/test"

    assert_equal expected, actual
  end

  test 'table non actionable header' do
    options  = { actionable: false }
    action   = UiBibz::Ui::Ux::Actionable.new(@store, options)
    actual   = action.header []
    expected = []

    assert_equal expected, actual
  end

  test 'table non actionable body' do
    options  = { actionable: false }
    action   = UiBibz::Ui::Ux::Actionable.new(@store, options)
    actual   = action.body @store.records.first, []
    expected = []

    assert_equal expected, actual
  end

  test 'simple table_card' do
    actual = UiBibz::Ui::Ux::TableCard.new(store: @users, tap: true).render
  end

  test 'complex table_card' do
    actual = UiBibz::Ui::Ux::TableCard.new({ store: @users, tap: true }, { class: 'toto' }).tap do |pane|
      pane.header 'Test header'
      pane.block class: 'ui' do
        'Test body'
      end
    end.render
  end

  test 'complex table_card with custom actions' do
    actual = UiBibz::Ui::Ux::TableCard.new({ store: @users, tap: true }, { class: 'toto'}).tap do |pane|
      pane.header 'Test header'
      pane.block cls: 'ui' do
        'Test body'
      end
      pane.columns do |c|
        c.column(:id, { name: '#' })
        c.column(:name_fr, { name: 'Name fr', link: edit_user_path(:id), order: 2 })
        c.column(:name_en, { name: 'Name en', order: 1 })
        c.column(:name_en, { name: 'Name en', format: lambda{ |records, record| "name #{ record.id}"}})
      end
      pane.actions do |a|
        a.link 'toto', url: users_path(:id), glyph: 'eye'
        a.divider
        a.link 'momo', url: users_path(:id), glyph: 'home'
      end
    end.render
  end

  test 'format action' do
    actual = UiBibz::Ui::Ux::TableCard.new(store: @users, tap: true).tap do |pane|
      pane.columns do |cls|
        cls.column :id, name: '#'
      end
      pane.actions do |acs|
        acs.format do |record|
          acs.action 'Action statique', url: '#'
          acs.action "Action dynamique #{record.id}", url: '#'
        end
      end
    end
  end

  test 'table visual options' do
    table  = UiBibz::Ui::Ux::Table.new(store: @users, striped: true, state: :inverse, responsive: true, bordered: true, size: :sm, hoverable: true, reflow: true).render
    actual = Nokogiri::HTML(table).xpath("//table")[0].attributes["class"].value
    expected = "table-inverse table table-striped table-bordered table-hoverable table-sm table-responsive table-reflow"

    assert_equal expected, actual
  end

  test 'table thead visual options' do
    table  = UiBibz::Ui::Ux::Table.new(store: @users, thead: { state: :default }).render
    actual = Nokogiri::HTML(table).xpath("//thead")[0].attributes["class"].value
    expected = "thead-default"

    assert_equal expected, actual
  end
end
