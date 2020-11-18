describe Bookmarks do
  describe '.create' do
    it 'adds a bookmark to the database' do
      bookmark = Bookmarks.create(title: 'Goal', url: 'http://www.goal.com')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a(Bookmarks)
      expect(bookmark.title).to eq('Goal')
      expect(bookmark.url).to eq('http://www.goal.com')
    end
  end

  describe '.all' do
    it 'returns the full list of bookmarks' do
      connection = PG.connect(dbname: 'bookmarks_manager_test')

      Bookmarks.create(title: 'YouTube', url: 'http://www.youtube.com')
      Bookmarks.create(title: 'Sky Sports', url: 'http://www.skysports.com')
      Bookmarks.create(title: 'SoundCloud', url: 'http://www.soundcloud.com')
  
      expect(Bookmarks.all.first.url).to eq('http://www.youtube.com')
    end
  end

  describe '.delete' do
    it 'deletes the bookmark by id' do
      bookmark = Bookmarks.create(title: 'Facebook', url: 'http://www.facebook.com')
      Bookmarks.delete(id: bookmark.id)
      expect(Bookmarks.all.length).to eq(0)
    end
  end
end