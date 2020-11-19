require_relative './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmarks_manager_test')
else
  DatabaseConnection.setup('bookmarks_manager')
end