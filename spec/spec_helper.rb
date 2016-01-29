require 'simplecov'
SimpleCov.start
require 'rspec'
require File.expand_path('../../lib/packit.rb', __FILE__)

FIXTURE_PATH = File.expand_path('../fixtures', __FILE__)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
