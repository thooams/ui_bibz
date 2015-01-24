require 'test_helper'
require 'active_model'

include UiBibz::Helpers
class UiHelperTest < ActionView::TestCase

  test 'complex panel' do
    panel cls: 'toto' do |pane|
      pane.header cls: 'header-class' do
        "Test header"
      end
      pane.body 'Test body', nil, cls: 'body-toto'
      pane.footer 'Test footer'
    end
  end

  test 'nav' do
    nav({cls: 'nav-momo'}) do
      tab "<a href='#'>toto</a>"
    end
  end

  test 'tab' do
    tab "<a href='#'>toto</a>", { active: true }, { class: 'tab'}
  end

  test 'complex grid' do
    create_list(:user, 25)
    users   = User.paginate(page: 1, per_page: 10)

    grid store: users, pagination: true, cls: 'toto' do |pane|
      pane.header 'Test header'
      pane.body cls: 'ui' do
        'Test body'
      end
    end
  end

  test 'complex grid with custom actions' do
    create_list(:user, 25)
    users   = User.paginate(page: 1, per_page: 10)

    grid store: users, pagination: true, cls: 'toto' do |pane|
      pane.header 'Test header'
      pane.body cls: 'ui' do
        'Test body'
      end
      pane.actions do
        link_to 'toto', users_path(:id)
        link_to 'momo', users_path(:id)
      end
    end
  end

  test 'link button' do
    link_button 'Toto', users_path
  end

end
