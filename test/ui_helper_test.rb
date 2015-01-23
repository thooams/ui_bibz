require 'test_helper'
require 'active_model'
require 'minitest/autorun' # for mock

include UiBibz::Helpers
class UiHelperTest < ActionView::TestCase

  test 'panel' do
    p = panel cls: 'toto' do |pane|
      pane.header cls: 'header-class' do
        "Text header"
      end
      pane.body 'Text body', nil, cls: 'body-toto'
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

  test 'grid' do
    collection = User.paginate(page: 1)

    g = grid store: collection, cls: 'toto' do |pane|
      pane.header 'toto'
      pane.body cls: 'ui' do
        'body'
      end
    end
    puts g
  end

end
