require_relative './database_connection.rb'
require_relative './bookmarks.rb'

class Tag
  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.create(content:)
    result = DatabaseConnection.query(
      "SELECT * FROM tags WHERE content = '#{content}';"
    ).first

    result = DatabaseConnection.query(
      "INSERT INTO tags (content) VALUES ('#{content}') RETURNING id, content;"
    ).first if !result

    Tag.new(id: result['id'], content: result['content'])
  end

  def self.find(tag_id:)
    result = DatabaseConnection.query("SELECT * FROM tags WHERE id = '#{tag_id}';")
    Tag.new(id: result[0]['id'], content: result[0]['content'])
  end

  def self.filter(bookmark_id:)
    result = DatabaseConnection.query(
      "SELECT id, content 
      FROM bookmarks_tags AS bt
      INNER JOIN tags AS t
      ON t.id = bt.tag_id 
      WHERE bt.bookmark_id = '#{bookmark_id}';"
    )

    result.map do |tag|
      Tag.new(id: tag['id'], content: tag['content'])
    end
  end

  def bookmarks(bookmark_class = Bookmark)
    bookmark_class.filter_by_tag(tag_id: @id)
  end
end