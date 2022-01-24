ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'app_controller.rb')
require File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'listing_controller.rb')
require File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'user_controller.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './setup_test_database'

# Tell Capybara to talk to MakersBnB
# Capybara.app = MakersBnB
# Capybara.app = ListingController
Capybara.app = UserController

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
