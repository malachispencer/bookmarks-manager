feature 'add tag to bookmark' do
  scenario 'user adds a tag to a bookmark' do
    bookmark = Bookmark.create(title: 'Goal', url: 'http://www.goal.com')

    visit('/bookmarks')
    first('.bookmark').click_button('Add tag')

    expect(current_path).to eq("/bookmarks/#{bookmark.id}/tags/new")

    fill_in('tag', with: 'football')
    click_button('Submit')

    expect(current_path).to eq('/bookmarks')
    expect(first('.bookmark')).to have_content('football')
  end
end