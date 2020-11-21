describe BookmarkTag do
  describe '.create' do
    it 'adds a BookmarkTag to the database' do
      bookmark = Bookmark.create(title: 'Goal', url: 'http://www.goal.com')
      tag = Tag.create(content: 'football')
      bookmark_tag = BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag.id)
      bookmark_tag_from_db = persisted_data(table: bookmarks_tags, id: bookmark_tag.id)

      expect(bookmark_tag.id).to eq(bookmark_tag_from_db['id'])
      expect(bookmark_tag.bookmark_id).to eq(bookmark.id)
      expect(bookmark_tag.tag_id).to eq(tag.id)
    end
  end
end