describe Bookmarks do
  describe '.all' do
    it 'returns the full list of bookmarks' do
      connection = PG.connect(dbname: 'bookmarks_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.youtube.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.skysports.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.soundcloud.com');")

      bookmarks = Bookmarks.all

      expect(bookmarks).to include('http://www.youtube.com')
      expect(bookmarks).to include('http://www.skysports.com')
      expect(bookmarks).to include('http://www.soundcloud.com')
    end
  end
end