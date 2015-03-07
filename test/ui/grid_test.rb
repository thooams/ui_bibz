require 'test_helper'
require "ui_bibz/ui/grid/ux/paginable"
require "ui_bibz/ui/grid/ux/searchable"
require "ui_bibz/ui/grid/ux/sortable"
require "ui_bibz/ui/grid/ux/actionable"
class GridTest < ActionView::TestCase

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
    users  = User.grid_search_pagination(params, session)
    @store = UiBibz::Ui::Store.new users
  end

  test 'grid non sortable' do
    options  = { sortable: false }
    actual   = UiBibz::Ui::Sortable.new(@store, options).header(@store.columns.list.first)
    expected = "Id"

    assert_equal expected, actual
  end

  test 'grid sortable' do
    options  = { sortable: true }
    actual   = UiBibz::Ui::Sortable.new(@store, options).header(@store.columns.list.first)
    expected = "<a class=\"dropup\" href=\"/users?direction=asc&amp;search=Name+fr&amp;sort=users.id\">Id</a>"

    assert_equal expected, actual
  end

  test 'grid non paginable' do
    options      = { paginable: false }
    pagination   = UiBibz::Ui::Paginable.new(@store, options)
    actual       = pagination.render if pagination.paginable?
    expected     = nil

    assert_equal expected, actual
  end

  test 'grid paginable' do
    options      = { paginable: true }
    pagination   = UiBibz::Ui::Paginable.new(@store, options)
    actual       = pagination.render if pagination.paginable?
    expected = "<div><ul class=\"pagination pagination\"><li class=\"prev disabled\"><span>&#8592; Previous</span></li> <li class=\"active\"><span>1</span></li> <li><a rel=\"next\" href=\"/users?page=2\">2</a></li> <li><a href=\"/users?page=3\">3</a></li> <li><a href=\"/users?page=4\">4</a></li> <li><a href=\"/users?page=5\">5</a></li> <li><a href=\"/users?page=6\">6</a></li> <li><a href=\"/users?page=7\">7</a></li> <li><a href=\"/users?page=8\">8</a></li> <li><a href=\"/users?page=9\">9</a></li> <li class=\"disabled\"><span>&hellip;</span></li> <li><a href=\"/users?page=12\">12</a></li> <li><a href=\"/users?page=13\">13</a></li> <li class=\"next\"><a rel=\"next\" href=\"/users?page=2\">Next &#8594;</a></li></ul><div class=\"per-page\">Displaying User <b>1&nbsp;-&nbsp;2</b> of <b>25</b> in total | Per page: <select name=\"per_page\" id=\"per_page\" class=\"form-control\"><option value=\"25\">25</option>
<option value=\"50\">50</option>
<option value=\"100\">100</option></select></div><br class=\"clear\" /></div>"

    assert_equal expected, actual
  end

  test 'grid non searchable' do
    options  = { searchable: false }
    actual   = UiBibz::Ui::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\">Users list</div><br class=\"clear\" /></div>"

    assert_equal expected, actual
  end

  test 'grid non searchable with a title and glyph' do
    options  = { searchable: false, glyph: 'toto', title: 'Title list' }
    actual   = UiBibz::Ui::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\"><i class=\"glyph fa fa-toto fa-1x\"></i>Title list</div><br class=\"clear\" /></div>"

    assert_equal expected, actual
  end

  test 'grid searchable' do
    options  = { searchable: true }
    actual   = UiBibz::Ui::Searchable.new(@store, options).render
    expected = "<div><div class=\"title\">Users list</div><div class=\"input-group input-group-sm\"><span class=\"input-group-addon\"><i class=\"glyph fa fa-search fa-1x\"></i></span><input type=\"search\" value=\"Name fr\" name=\"search\" class=\"form-control\" placeholder=\"Search by name_fr and name_en...\" /><span class=\"clear-search-btn input-group-addon\"><i class=\"glyph fa fa-times-circle fa-1x\"></i></span></div><br class=\"clear\" /></div>"

    assert_equal expected, actual
  end

  test 'grid actionable header' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Actionable.new(@store, options)
    actual   = action.header []
    expected = ["<th class=\"action\"></th>"]

    assert_equal expected, actual
  end

  test 'grid actionable body' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Actionable.new(@store, options)
    actual   = action.body @store.records.first, []
    expected = ["<td><div class=\"btn-group-xs dropdown\"><button class=\"btn btn-default dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\" aria-expanded=\"false\"><i class=\"glyph fa fa-ellipsis-v fa-1x fa-fw\"></i>Actions<span class=\"caret\"></span></button><ul class=\"dropdown-menu dropdown-menu-right\" role=\"menu\"><li role=\"presentation\"><a role=\"menuitem\" tabindex=\"-1\" href=\"/users/1\"><i class=\"glyph fa fa-eye fa-1x fa-fw\"></i> Show</a></li><li role=\"presentation\"><a role=\"menuitem\" tabindex=\"-1\" href=\"/users/1/edit\"><i class=\"glyph fa fa-pencil fa-1x fa-fw\"></i> Edit</a></li><li role=\"presentation\"><a data-confirm=\"Are you sure?\" role=\"menuitem\" tabindex=\"-1\" rel=\"nofollow\" data-method=\"delete\" href=\"/users?id=1\"><i class=\"glyph fa fa-trash fa-1x fa-fw\"></i> Delete</a></li></ul></div></td>"]

    assert_equal expected, actual
  end

  test 'grid actionable inject_url' do
    options  = { actionable: true }
    action   = UiBibz::Ui::Actionable.new(@store, options)
    actual   = action.inject_url 'http://localhost/users/id/test', @store.records.first
    expected = "http://localhost/users/1/test"

    assert_equal expected, actual
  end

  test 'grid non actionable header' do
    options  = { actionable: false }
    action   = UiBibz::Ui::Actionable.new(@store, options)
    actual   = action.header []
    expected = []

    assert_equal expected, actual
  end

  test 'grid non actionable body' do
    options  = { actionable: false }
    action   = UiBibz::Ui::Actionable.new(@store, options)
    actual   = action.body @store.records.first, []
    expected = []

    assert_equal expected, actual
  end

end
