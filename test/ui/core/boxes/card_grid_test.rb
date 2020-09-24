# frozen_string_literal: true

require 'test_helper'

class CardGridTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'create card' do
    actual = ui_card_grid do |cg|
      cg.card "card 1"
      cg.card "card 2"
    end
    expected = "<div class=\"card-grid row row-cols\"><div class=\"col\"><div class=\"card\"><div class=\"card-body\">card 1</div></div></div><div class=\"col\"><div class=\"card\"><div class=\"card-body\">card 2</div></div></div></div>"

    assert_equal expected, actual
  end
end
