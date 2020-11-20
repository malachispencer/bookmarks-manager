feature 'adding comments to bookmarks' do
  scenario 'user enters a comment on a bookmark' do
    bookmark = Bookmark.create(title: 'Arsenal', url: 'http://www.arsenal.com')
    visit('/')
    click_link('Bookmarks')

    first('.bookmark').click_button('Add Comment')

    expect(current_path).to eq("/bookmarks/#{bookmark.id}/comments/new")

    fill_in('comment', with: 'Arteta Out!')
    click_button('Submit')

    expect(current_path).to eq('/bookmarks')
    expect(page).to have_content('Arteta Out!')
  end
end