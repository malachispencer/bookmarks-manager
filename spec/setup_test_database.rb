def setup_test_database
  connection = PG.connect(dbname: 'bookmarks_manager_test')
  connection.exec('TRUNCATE bookmarks, comments, tags, bookmarks_tags, users;')
end