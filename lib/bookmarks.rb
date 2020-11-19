require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.create(title:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmarks_manager')
    end

    result = connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmarks_manager')
    end
    
    result = connection.exec('SELECT * FROM bookmarks;')

    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.update(id:, title:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmarks_manager')
    end

    connection.exec(
      "UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id};"
      )
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmarks_manager')
    end

    connection.exec("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmarks_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end