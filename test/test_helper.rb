# frozen_string_literal: true

# Code climate
require 'simplecov'
SimpleCov.start 'rails'

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
require "rails/test_help"
require "factory_bot_rails"

# Filter out the backtrace from minitest while preserving the one from other libraries.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

require "rails/test_unit/reporter"
Rails::TestUnitReporter.executable = 'bin/test'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_paths = [File.expand_path("fixtures", __dir__)]
  ActionDispatch::IntegrationTest.fixture_paths = ActiveSupport::TestCase.fixture_paths || []
  ActiveSupport::TestCase.file_fixture_path = "#{ActiveSupport::TestCase.fixture_paths&.first}/files"
  ActiveSupport::TestCase.fixtures :all
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end
