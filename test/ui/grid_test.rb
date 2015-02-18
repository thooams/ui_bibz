require 'test_helper'
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
    users  = User.grid_search_pagination(params)
    @store = UiBibz::Ui::Store.new users
  end

  test 'non sortable header' do
    options  = { sortable: false }
    actual   = UiBibz::Ui::Sortable.new(@store, options).header(@store.columns.list.first)
    expected = "Id"

    assert_equal expected, actual
  end

  test 'sortable header' do
    options  = { sortable: true }
    actual   = UiBibz::Ui::Sortable.new(@store, options).header(@store.columns.list.first)
    expected = "<a class=\"dropup\" href=\"/users?direction=asc&amp;search=Name+fr&amp;sort=users.id\">Id</a>"

    assert_equal expected, actual
  end

  test 'non paginable footer' do
    options      = { paginable: false }
    pagination   = UiBibz::Ui::Paginable.new(@store, options)
    actual       = pagination.render if pagination.paginable?
    expected     = nil

    assert_equal expected, actual
  end

  test 'paginable footer' do
    options      = { paginable: true }
    pagination   = UiBibz::Ui::Paginable.new(@store, options)
    actual       = pagination.render if pagination.paginable?
    expected = "<div><ul class=\"pagination pagination\"><li class=\"prev disabled\"><span>&#8592; Previous</span></li> <li class=\"active\"><span>1</span></li> <li><a rel=\"next\" href=\"/users?page=2\">2</a></li> <li><a href=\"/users?page=3\">3</a></li> <li><a href=\"/users?page=4\">4</a></li> <li><a href=\"/users?page=5\">5</a></li> <li><a href=\"/users?page=6\">6</a></li> <li><a href=\"/users?page=7\">7</a></li> <li><a href=\"/users?page=8\">8</a></li> <li><a href=\"/users?page=9\">9</a></li> <li class=\"disabled\"><span>&hellip;</span></li> <li><a href=\"/users?page=12\">12</a></li> <li><a href=\"/users?page=13\">13</a></li> <li class=\"next\"><a rel=\"next\" href=\"/users?page=2\">Next &#8594;</a></li></ul><div class=\"per-page\">Per page: <select name=\"per_page\" id=\"per_page\" class=\"form-control\"><option value=\"25\">25</option>
<option value=\"50\">50</option>
<option value=\"100\">100</option></select></div><br class=\"clear\" /></div>"

    assert_equal expected, actual
  end

end
