require 'factory_girl'
FactoryGirl.find_definitions
# for Spec expectation style
class MiniTest::Test
  include FactoryGirl::Syntax::Methods
end
