# frozen_string_literal: true

require 'test_helper'
require "ui_bibz/ui/ux/tables/components/store"
require 'will_paginate'

class StoreTest < ActionView::TestCase
  include WillPaginate::ActionView

  setup do
    create_list(:user, 25)
    params = ActionController::Parameters.new({
      controller: 'users',
      action:     'index',
      sort:       'users.name_fr',
      direction:  'asc',
      per_page:   10,
      page:       1
    })
    users  = User.table_search_pagination(params, session)
    @store = UiBibz::Ui::Ux::Tables::Store.new users
  end

  test 'total pages' do
    assert_equal @store.total_pages, 3
  end

  test 'current page' do
    assert_equal @store.current_page, 1
  end

  test 'limit value' do
    assert_equal @store.limit_value, 10
  end

  test 'model' do
    assert_equal @store.model, User
  end

  test 'records' do
    assert_equal @store.records.count, 25
  end

  test 'controller' do
    assert_equal @store.controller, 'users'
  end

end
