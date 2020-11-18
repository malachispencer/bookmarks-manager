feature 'delete bookmarks' do
  scenario 'user can press button to delete bookmark' do
    Bookmarks.create(title: 'Facebook', url: 'http://www.facebook.com')

    visit('/')
    click_link('Bookmarks')

    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')

    first('.bookmark').click_button('Delete')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('Facebook', href: 'http://www.facebook.com')
  end
end