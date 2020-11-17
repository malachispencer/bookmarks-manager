require 'pg'

class Bookmarks
  def self.all
    connection = PG.connect(dbname: 'bookmarks_manager')
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end
end