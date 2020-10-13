# frozen_string_literal: true

require 'test_helper'
require 'ui_bibz/ui/ux/tables/components/store'
require 'will_paginate'

class StoreTest < ActionView::TestCase
  include WillPaginate::ActionView

  setup do
    create_list(:user, 25)
    params = ActionController::Parameters.new({
                                                controller: 'users',
                                                action: 'index',
                                                sort: 'users.name_fr',
                                                direction: 'asc',
                                                per_page: 10,
                                                page: 1
                                              })
    users  = User.table_search_pagination(params, session)
    @store = UiBibz::Ui::Ux::Tables::Store.new users
  end

  test 'total pages' do
    assert_equal(3, @store.total_pages)
  end

  test 'current page' do
    assert_equal(1, @store.current_page)
  end

  test 'limit value' do
    assert_equal(10, @store.limit_value)
  end

  test 'model' do
    assert_equal @store.model, User
  end

  test 'records' do
    assert_equal(25, @store.records.count)
  end

  test 'controller' do
    assert_equal('users', @store.controller)
  end
end
