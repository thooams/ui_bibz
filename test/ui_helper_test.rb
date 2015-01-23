require 'test_helper'
require 'active_model'

include UiBibz::Helpers
class UiHelperTest < ActionView::TestCase

  test 'complex panel' do
    p = panel cls: 'toto' do |pane|
      pane.header cls: 'header-class' do
        "Test header"
      end
      pane.body 'Test body', nil, cls: 'body-toto'
      pane.footer 'Test footer'
    end
    puts p
  end

  test 'nav' do
    n = nav({cls: 'nav-momo'}) do
      "<a href='#'>toto</a>"
    end
    puts n
  end

  test 'tab' do
    t = tab "<a href='#'>toto</a>", { active: true }, { class: 'tab'}
    puts t
  end

  test 'complex grid' do
    create_list(:user, 25)
    users   = User.paginate(page: 1, per_page: 10)

    g = grid store: users, pagination: true, cls: 'toto' do |pane|
      pane.header 'Test header'
      pane.body cls: 'ui' do
        'Test body'
      end
    end
    puts g
  end

end
