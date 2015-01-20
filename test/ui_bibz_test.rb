require 'test_helper'

class UiBibzTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, UiBibz
  end

  test 'setup block yields self' do
    UiBibz.setup do |config|
      assert_equal UiBibz, config
    end
  end
end
