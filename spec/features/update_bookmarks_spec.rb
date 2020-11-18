feature 'update bookmark' do
  scenario 'user can change the title or url of a bookmark' do
    Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    visit('/')
    click_link('Bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    click_button('Update')

    expect(current_path).to eq('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makers.com')
  end
end