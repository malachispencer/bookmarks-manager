describe Comment do
  describe '.create' do
    let(:bookmark) { Bookmark.create(title: 'OVO', url: 'http://www.ovosound.com') }
    let(:comment)  { Comment.create(text: 'Drake is the MJ of this era', bookmark_id: bookmark.id) }
    let(:comment_from_db) { persisted_data(table: 'comments', id: comment.id) }

    it 'adds a comment to the database' do
      expect(comment.id).to eq(comment_from_db['id'])
      expect(comment.text).to eq('Drake is the MJ of this era')
    end
  end
end