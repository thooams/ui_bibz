require 'factory_bot'
FactoryBot.find_definitions
# for Spec expectation style
#class MiniTest::Test
  #include FactoryGirl::Syntax::Methods
#end
class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end
