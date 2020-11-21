describe Tag do
  describe '.create' do
    it 'adds a tag to the database' do
      bookmark = Bookmark.create(title: 'Goal', url: 'http://www.goal.com')
      tag = Tag.create(content: 'football', bookmark_id: bookmark.id)
      tag_from_db = persisted_data(table: 'tags', id: tag.id)

      expect(tag.id).to eq(tag_from_db.id)
      expect(tag.content).to eq('football')
    end
  end
end