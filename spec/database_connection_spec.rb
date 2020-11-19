describe DatabaseConnection do
  describe '.setup' do
    it 'establishes a connection to the database using PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmarks_manager_test')
      DatabaseConnection.setup('bookmarks_manager_test')
    end
  end

  describe '.query' do
    it "executes the query passed in using PG's exec method" do
      connection = DatabaseConnection.setup('bookmarks_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end