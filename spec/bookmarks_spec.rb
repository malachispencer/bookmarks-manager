describe Bookmark do
  describe '.create' do
    let(:bookmark) { Bookmark.create(title: 'Goal', url: 'http://www.goal.com') }
    let(:bookmark_from_db) { persisted_data(id: bookmark.id) }
    
    it 'adds a bookmark to the database' do
      expect(bookmark.id).to eq(bookmark_from_db['id'])
      expect(bookmark.url).to eq('http://www.goal.com')
    end
  end

  describe '.all' do
    it 'returns the full list of bookmarks' do

      test_bookmarks = [
        'http://www.youtube.com',
        'http://www.skysports.com',
        'http://www.soundcloud.com'
      ]

      Bookmark.create(title: 'YouTube', url: 'http://www.youtube.com')
      Bookmark.create(title: 'Sky Sports', url: 'http://www.skysports.com')
      Bookmark.create(title: 'SoundCloud', url: 'http://www.soundcloud.com')
      
      Bookmark.all.each do |bookmark|
        expect(test_bookmarks).to include(bookmark.url)
      end
    end
  end

  describe '.delete' do
    let(:bookmark) { Bookmark.create(title: 'Facebook', url: 'http://www.facebook.com') }

    it 'deletes a given bookmark by its id' do
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq(0)
    end
  end
end