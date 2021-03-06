describe Tag do
  describe '.create' do
    context "tag doesn't exist" do
      it 'adds a tag to the database' do
        tag = Tag.create(content: 'football')
        tag_from_db = persisted_data(table: 'tags', id: tag.id)

        expect(tag.id).to eq(tag_from_db['id'])
        expect(tag.content).to eq('football')
      end
    end

    context 'tag already exists' do
      it 'returns the already existing tag' do
        tag = Tag.create(content: 'music')
        tag_dup = Tag.create(content: 'music')

        expect(tag.id).to eq(tag_dup.id)
      end
    end
  end

  describe '.find' do
    it 'retuns the tag with the given id' do
      tag_one = Tag.create(content: 'canada')
      tag_two = Tag.create(content: 'usa')
      found_tag = Tag.find(tag_id: tag_one.id)
      
      expect(found_tag.id).to eq(tag_one.id)
      expect(found_tag.content).to eq('canada')
    end
  end

  describe '.filter' do
    it 'returns all the tags for the Bookmark(id) passed in' do
      bookmark = Bookmark.create(title: 'Goal', url: 'http://www.goal.com')
      tag_one = Tag.create(content: 'football')
      tag_two = Tag.create(content: 'sports')
      BookmarkTag.create(tag_id: tag_one.id, bookmark_id: bookmark.id)
      BookmarkTag.create(tag_id: tag_two.id, bookmark_id: bookmark.id)
      tags = Tag.filter(bookmark_id: bookmark.id)
      
      expect(tags[0].id).to eq(tag_one.id)
      expect(tags[1].content).to eq(tag_two.content)
    end
  end

  describe '#bookmarks' do
    let(:bookmark_class) { double('bookmark_class') }

    it 'calls the .filter_by_tag method in the Bookmark class' do
      tag = Tag.create(content: 'toronto')
      expect(bookmark_class).to receive(:filter_by_tag).with(tag_id: tag.id)
      tag.bookmarks(bookmark_class)
    end
  end
end