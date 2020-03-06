# frozen_string_literal: true

require 'factory_bot'
FactoryBot.find_definitions
# for Spec expectation style
# class MiniTest::Test
# include FactoryGirl::Syntax::Methods
# end
module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
  end
end
