feature 'update bookmark' do
  scenario 'user can change the title or url of a bookmark' do
    Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    visit('/')
    click_link('Bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button('Edit')
    fill_in('title', with: 'Makers')
    fill_in('url', with: 'http://www.makers.com')
    click_button('Submit')

    expect(current_path).to eq('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makers.com')
  end
end