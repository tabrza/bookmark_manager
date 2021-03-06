ENV['RACK_ENV'] = 'test'

require_relative 'features/web_helpers'
require './app/app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'sinatra'
require 'database_cleaner'
# require 'simplecov'
# require 'simplecov-console'


Capybara.app = BookmarkManager

# SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
#   SimpleCov::Formatter::Console,
# ])
# SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
