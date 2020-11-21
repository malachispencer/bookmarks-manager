require_relative './database_connection.rb'

class BookmarkTag
  attr_reader :tag_id, :bookmark_id

  def initialize(tag_id:, bookmark_id:)
    @tag_id = tag_id
    @bookmark_id = bookmark_id
  end

  def self.create(tag_id:, bookmark_id:)
    result = DatabaseConnection.query(
      "INSERT INTO bookmarks_tags (tag_id, bookmark_id) VALUES ('#{tag_id}', '#{bookmark_id}') RETURNING tag_id, bookmark_id;"
    )

    BookmarkTag.new(
      tag_id: result[0]['tag_id'],
      bookmark_id: result[0]['bookmark_id']
    )
  end
end