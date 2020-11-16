describe Bookmarks do
  describe '.all' do
    it 'returns the full list of bookmarks' do

      test_bookmarks = [
        'http://www.youtube.com',
        'http://www.skysports.com',
        'http://www.soundcloud.com'
      ]

      bookmarks = Bookmarks.all
      
      test_bookmarks.each do |bookmark|
        expect(bookmakrs).to include(bookmark)
      end
    end
  end
end