describe Comment do
  let(:bookmark_one) { Bookmark.create(title: 'OVO', url: 'http://www.ovosound.com') }
  let(:bookmark_two) { Bookmark.create(title: 'XO', url: 'http://www.theweeknd.com') }
  let(:comment_one)  { Comment.create(text: 'Drake is the MJ of this era', bookmark_id: bookmark_one.id) }
  let(:comment_two)  { Comment.create(text: 'The Weeknd is my favourite singer', bookmark_id: bookmark_two.id) }
  let(:comment_three)  { Comment.create(text: 'Drake been on top 11 years', bookmark_id: bookmark_one.id) }
  let(:comment_one_from_db) { persisted_data(table: 'comments', id: comment_one.id) }

  describe '.create' do
    it 'adds a comment to the database' do
      expect(comment_one.id).to eq(comment_one_from_db['id'])
      expect(comment_one.text).to eq('Drake is the MJ of this era')
    end
  end

  describe '.filter' do
    it 'returns all the comments for the given bookmark' do
      expect(Comment.filter(id: bookmark_one.id).length).to eq(2)
    end
  end
end