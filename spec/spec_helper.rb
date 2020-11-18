require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'pg'
require_relative '../app.rb'
require_relative '../lib/bookmarks.rb'
require_relative './setup_test_database.rb'
require_relative './database_helpers.rb'

ENV['ENVIRONMENT'] = 'test'

Capybara.app = BookmarksManager

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])

SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
