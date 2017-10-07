require 'test_helper'
require "ui_bibz/ui/ux/tables/components/store"
require "ui_bibz/ui/ux/tables/extensions/paginable"
require "ui_bibz/ui/ux/tables/extensions/searchable"
require "ui_bibz/ui/ux/tables/extensions/sortable"
require "ui_bibz/ui/ux/tables/extensions/actionable"

class TableTest < ActionView::TestCase

  setup do
    create_list(:user, 25)
    params = ActionController::Parameters.new({
      controller: 'users',
      action:     'index',
      sort:       'users.name_fr',
      direction:  'asc',
      search:     'Name fr',
      per_page:   2,
      page:       1
    })
    @users  = User.table_search_pagination(params, session)
    @store = UiBibz::Ui::Ux::Tables::Store.new @users
  end

  test 'table search field' do
    actual   = UiBibz::Ui::Ux::Tables::TableSearchField.new({ store: @users}).render
    expected = "<form class=\"form-table-search-field\" action=\"/users?direction=asc&amp;page=1&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><div class=\"input-group input-group-sm table-search-field\"><span class=\"input-group-addon\"><i class=\"glyph fa fa-search\"></i></span><input type=\"hidden\" name=\"sort\" value=\"users.name_fr\" /><input type=\"hidden\" name=\"direction\" value=\"asc\" /><input type=\"hidden\" name=\"per_page\" value=\"2\" /><input type=\"hidden\" name=\"page\" value=\"1\" /><input type=\"hidden\" name=\"link_type\" value=\"search\" /><input type=\"search\" value=\"Name fr\" name=\"search\" class=\"form-control\" placeholder=\"Search by Name fr and Name en...\" /><span class=\"input-group-btn clear-search-btn\"><button type=\"button\" class=\"btn btn-secondary\"><i class=\"glyph fa fa-times-circle\"></i></button></span></div></form>"

    assert_equal expected, actual
  end

  test 'table pagination' do
    actual = UiBibz::Ui::Ux::Tables::TablePagination.new({ store: @users }).render
    expected = "<nav class=\"pagination\"><ul class=\"pagination\" role=\"group\"><li class=\"previous page-item disabled\"><span class=\"page-link\">&laquo;</span></li> <li class=\"page-item active\"><span class=\"page-link\">1</span></li> <li class=\"page-item\"><a class=\"page-link\" rel=\"next\" href=\"/users?direction=asc&amp;page=2&amp;search=Name+fr&amp;sort=users.name_fr\">2</a></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=3&amp;search=Name+fr&amp;sort=users.name_fr\">3</a></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=4&amp;search=Name+fr&amp;sort=users.name_fr\">4</a></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=5&amp;search=Name+fr&amp;sort=users.name_fr\">5</a></li> <li class=\"page-item disabled\"><i class=\"page-link\">&hellip;</i></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=12&amp;search=Name+fr&amp;sort=users.name_fr\">12</a></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=13&amp;search=Name+fr&amp;sort=users.name_fr\">13</a></li> <li class=\"next page-item\"><a class=\"page-link\" rel=\"next\" href=\"/users?direction=asc&amp;page=2&amp;search=Name+fr&amp;sort=users.name_fr\">&raquo;</a></li></ul></nav>"

    assert_equal expected, actual
  end

  test 'table non sortable' do
    options  = { sortable: false }
    actual   = UiBibz::Ui::Ux::Tables::Sortable.new(@store, options).header(@store.columns.list.first)
    expected = "Id"

    assert_equal expected, actual
  end

  test 'table sortable' do
    options  = { sortable: true }
    actual   = UiBibz::Ui::Ux::Tables::Sortable.new(@store, options).header(@store.columns.list.first)
    expected = "<a class=\"dropup\" href=\"/users?action=index&amp;column_id=id&amp;column_id=id&amp;controller=users&amp;direction=asc&amp;direction=asc&amp;link_type=column&amp;link_type=column&amp;only_path=true&amp;search=Name+fr&amp;search=Name+fr&amp;sort=users.id&amp;sort=users.id\">Id</a>"

    assert_equal expected, actual
  end

  test 'table non paginable' do
    options      = { paginable: false }
    pagination   = UiBibz::Ui::Ux::Tables::Paginable.new(@store, options)
    actual       = pagination.render if pagination.paginable?
    expected     = nil

    assert_nil actual
  end

  test 'table paginable' do
    options      = { paginable: true }
    pagination   = UiBibz::Ui::Ux::Tables::Paginable.new(@store, options)
    actual       = pagination.render if pagination.paginable?
    expected     = "<div><nav class=\"pagination\"><ul class=\"pagination\" role=\"group\"><li class=\"previous page-item disabled\"><span class=\"page-link\">&laquo;</span></li> <li class=\"page-item active\"><span class=\"page-link\">1</span></li> <li class=\"page-item\"><a class=\"page-link\" rel=\"next\" href=\"/users?direction=asc&amp;page=2&amp;search=Name+fr&amp;sort=users.name_fr\">2</a></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=3&amp;search=Name+fr&amp;sort=users.name_fr\">3</a></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=4&amp;search=Name+fr&amp;sort=users.name_fr\">4</a></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=5&amp;search=Name+fr&amp;sort=users.name_fr\">5</a></li> <li class=\"page-item disabled\"><i class=\"page-link\">&hellip;</i></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=12&amp;search=Name+fr&amp;sort=users.name_fr\">12</a></li> <li class=\"page-item\"><a class=\"page-link\" href=\"/users?direction=asc&amp;page=13&amp;search=Name+fr&amp;sort=users.name_fr\">13</a></li> <li class=\"next page-item\"><a class=\"page-link\" rel=\"next\" href=\"/users?direction=asc&amp;page=2&amp;search=Name+fr&amp;sort=users.name_fr\">&raquo;</a></li></ul></nav><form action=\"/users\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><div class=\"table-pagination-per-page\">Displaying User <b>1&nbsp;-&nbsp;2</b> of <b>25</b> in total | Per page: <input type=\"hidden\" name=\"sort\" value=\"users.name_fr\" /><input type=\"hidden\" name=\"direction\" value=\"asc\" /><input type=\"hidden\" name=\"per_page\" value=\"2\" /><select name=\"per_page\" id=\"per_page\" class=\"form-control\"><option value=\"5\">5</option>
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
    actual   = UiBibz::Ui::Ux::Tables::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\">Users list</div><br class=\"ui-bibz-clear\" /></div>"

    assert_equal expected, actual
  end

  test 'table non searchable with a title and glyph' do
    options  = { searchable: false, glyph: 'state', title: 'Title list' }
    actual   = UiBibz::Ui::Ux::Tables::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\"><i class=\"glyph fa fa-state\"></i>Title list</div><br class=\"ui-bibz-clear\" /></div>"

    assert_equal expected, actual
  end

  test 'table searchable' do
    options  = { searchable: true }
    actual   = UiBibz::Ui::Ux::Tables::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\">Users list</div><form class=\"form-table-search-field\" action=\"/users?direction=asc&amp;page=1&amp;per_page=2&amp;search=Name+fr&amp;sort=users.name_fr\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><div class=\"input-group input-group-sm table-search-field\"><span class=\"input-group-addon\"><i class=\"glyph fa fa-search\"></i></span><input type=\"hidden\" name=\"sort\" value=\"users.name_fr\" /><input type=\"hidden\" name=\"direction\" value=\"asc\" /><input type=\"hidden\" name=\"per_page\" value=\"2\" /><input type=\"hidden\" name=\"page\" value=\"1\" /><input type=\"hidden\" name=\"link_type\" value=\"search\" /><input type=\"search\" value=\"Name fr\" name=\"search\" class=\"form-control\" placeholder=\"Search by Name fr and Name en...\" /><span class=\"input-group-btn clear-search-btn\"><button type=\"button\" class=\"btn btn-secondary\"><i class=\"glyph fa fa-times-circle\"></i></button></span></div></form><br class=\"ui-bibz-clear\" /></div>"

    assert_equal expected, actual
  end

  test 'table actionable header' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Ux::Tables::Actionable.new(@store, options)
    actual   = action.header []
    expected = ["<th class=\"action\"></th>"]

    assert_equal expected, actual
  end

  test 'table actionable body' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Ux::Tables::Actionable.new(@store, options)
    actual   = action.body @store.records.first, []
    expected = ["<td></td>"]

    assert_equal expected, actual
  end

  test 'table actionable inject_url' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Ux::Tables::Actionable.new(@store, options)
    actual   = action.inject_url 'http://localhost/users/id/test', @store.records.first
    expected = "http://localhost/users/1/test"

    assert_equal expected, actual
  end

  test 'table non actionable header' do
    options  = { actionable: false }
    action   = UiBibz::Ui::Ux::Tables::Actionable.new(@store, options)
    actual   = action.header []
    expected = []

    assert_equal expected, actual
  end

  test 'table non actionable body' do
    options  = { actionable: false }
    action   = UiBibz::Ui::Ux::Tables::Actionable.new(@store, options)
    actual   = action.body @store.records.first, []
    expected = []

    assert_equal expected, actual
  end

  test 'simple table_card' do
    actual = UiBibz::Ui::Ux::Tables::TableCard.new(store: @users, tap: true).render
  end

  test 'complex table_card' do
    actual = UiBibz::Ui::Ux::Tables::TableCard.new({ store: @users, tap: true }, { class: 'state' }).tap do |pane|
      pane.header 'Test header'
      pane.body class: 'ui' do
        'Test body'
      end
    end.render
  end

  test 'complex table_card with custom actions' do
    actual = UiBibz::Ui::Ux::Tables::TableCard.new({ store: @users, tap: true }, { class: 'state'}).tap do |pane|
      pane.header 'Test header'
      pane.body cls: 'ui' do
        'Test body'
      end
      pane.columns do |c|
        c.column(:id, { name: '#' })
        c.column(:name_fr, { name: 'Name fr', link: edit_user_path(:id), order: 2 })
        c.column(:name_en, { name: 'Name en', order: 1 })
        c.column(:name_en, { name: 'Name en', format: lambda{ |records, record| "name #{ record.id}"}})
      end
      pane.actions do |a|
        a.link 'state', url: users_path(:id), glyph: 'eye'
        a.divider
        a.link 'momo', url: users_path(:id), glyph: 'home'
      end
    end.render
  end

  test 'format action' do
    actual = UiBibz::Ui::Ux::Tables::TableCard.new(store: @users, tap: true).tap do |pane|
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
    table  = UiBibz::Ui::Ux::Tables::Table.new(store: @users, striped: true, status: :inverse, responsive: true, bordered: true, size: :sm, hoverable: true, reflow: true).render
    actual = Nokogiri::HTML(table).xpath("//table")[0].attributes["class"].value
    expected = "table-inverse table table-striped table-bordered table-hoverable table-sm table-responsive table-reflow"

    assert_equal expected, actual
  end

  test 'table thead visual options' do
    table  = UiBibz::Ui::Ux::Tables::Table.new(store: @users, thead: { status: :default }).render
    actual = Nokogiri::HTML(table).xpath("//thead")[0].attributes["class"].value
    expected = "thead-default"

    assert_equal expected, actual
  end
end
