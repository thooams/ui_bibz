require 'test_helper'
include UiBibz::Helpers
class GridTest < ActionView::TestCase

  setup do
    create_list(:user, 25)
    params = {
      controller: 'users',
      action:     'index',
      sort:       'users.name_fr',
      direction:  'asc',
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
    expected = "<a class=\"dropup\" href=\"/users?direction=asc&amp;sort=users.id\">Id</a>"

    assert_equal expected, actual

  end

end
