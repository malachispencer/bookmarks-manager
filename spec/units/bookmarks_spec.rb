describe Bookmark do
  describe '.create' do
    let(:bookmark) { Bookmark.create(title: 'Goal', url: 'http://www.goal.com') }
    let(:bookmark_from_db) { persisted_data(table: 'bookmarks', id: bookmark.id) }
    
    it 'adds a bookmark to the database' do
      expect(bookmark.id).to eq(bookmark_from_db['id'])
      expect(bookmark.url).to eq('http://www.goal.com')
    end

    it "doesn't add a bookmark if the URL has no scheme" do
      expect(Bookmark.create(title: 'fakenews', url: 'www.makers.com')).to eq(nil)
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

  describe '.update' do
    it 'allows user to update title and/or url' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      Bookmark.update(id: bookmark.id, title: 'Makers', url: 'http://www.makers.com')
      expect(Bookmark.all.first.url).to eq('http://www.makers.com')
    end
  end

  describe '.delete' do
    it 'deletes a given bookmark by its id' do
      bookmark = Bookmark.create(title: 'Facebook', url: 'http://www.facebook.com')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe '.find' do
    it 'finds a bookmark from the database by ID and returns it' do
      bookmark_one = Bookmark.create(title: 'Codewars', url: 'http://www.codewars.com')
      bookmark_two = Bookmark.create(title: 'HackerRank', url: 'http://www.hackerrank.com')
      expect(Bookmark.find(id: bookmark_one.id).url).to eq(bookmark_one.url)
    end
  end

  describe '#comments' do
    let(:comment_class) { double('comment_class') }

    it 'calls the filter method in the Comments class on a Bookmark instance' do
      bookmark = Bookmark.create(title: 'Makers', url: 'http://www.makers.com')
      expect(comment_class).to receive(:filter).with(bookmark_id: bookmark.id)
      bookmark.comments(comment_class)
    end
  end

  describe '#tags' do
    let(:tag_class) { double :tag_class }

    it 'calls the filter method in the Tag class' do
      bookmark = Bookmark.create(title: 'Makers', url: 'http://www.makers.com')
      expect(tag_class).to receive(:filter).with(bookmark_id: bookmark.id)
      bookmark.tags(tag_class)
    end
  end
end