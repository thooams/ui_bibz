# frozen_string_literal: true

require 'test_helper'
require 'ui_bibz/ui/ux/tables/components/store'
require 'ui_bibz/ui/ux/tables/extensions/paginable'
require 'ui_bibz/ui/ux/tables/extensions/searchable'
require 'ui_bibz/ui/ux/tables/extensions/sortable'
require 'ui_bibz/ui/ux/tables/extensions/actionable'

class TableCardTest < ActionView::TestCase
  setup do
    create_list(:user, 25)
    params = ActionController::Parameters.new({
                                                controller: 'users',
                                                action: 'index',
                                                sort: 'users.name_fr',
                                                direction: 'asc',
                                                search: 'Name fr',
                                                per_page: 2,
                                                page: 1,
                                                only_path: true
                                              })
    @users = User.table_search_pagination(params, session)
    @store = UiBibz::Ui::Ux::Tables::Store.new @users
  end

  test 'table card visual options' do
    table_card = UiBibz::Ui::Ux::Tables::TableCard.new(store: @users, table_options: { striped: true, responsive: true, bordered: true, size: :sm, hoverable: true, breakpoint: :sm }).render
    actual_table_classes = Nokogiri::HTML(table_card).xpath('//table')[0].attributes['class'].value
    div_classes = Nokogiri::HTML(table_card).xpath('//div').css('.table-responsive-sm')[0].attributes['class'].value
    table_classes = 'table table-striped table-bordered table-hoverable table-sm'
    actual_div_classes = 'table-responsive-sm'

    assert_equal table_classes, actual_table_classes
    assert_equal div_classes, actual_div_classes
  end
end
