describe Comment do
  
  
  
  describe '.create' do
    it 'adds a comment to the database' do
      bookmark = Bookmark.create(title: 'OVO', url: 'http://www.ovosound.com')
      comment = Comment.create(text: 'Drake is the MJ of this era', bookmark_id: bookmark.id)
      comment_from_db = persisted_data(table: 'comments', id: comment.id)

      expect(comment.id).to eq(comment_from_db['id'])
      expect(comment.text).to eq('Drake is the MJ of this era')
    end
  end

  describe '.filter' do
    it 'returns all the comments for the given bookmark' do
      bookmark_one = Bookmark.create(title: 'OVO', url: 'http://www.ovosound.com')
      bookmark_two = Bookmark.create(title: 'XO', url: 'http://www.theweeknd.com')

      comment_one = Comment.create(text: 'Drake is the MJ of this era', bookmark_id: bookmark_one.id)
      comment_two = Comment.create(text: 'The Weeknd is my favourite singer', bookmark_id: bookmark_two.id)
      comment_three = Comment.create(text: 'Drake been on top 11 years', bookmark_id: bookmark_one.id)

      Comment.filter(bookmark_id: bookmark_one.id).each do |comment|
        expect([comment_one.text, comment_three.text]).to include(comment.text)
      end
    end
  end
end