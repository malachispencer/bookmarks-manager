def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmarks_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end