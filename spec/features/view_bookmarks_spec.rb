feature 'viewing bookmarks' do
  scenario 'visiting the bookmarks page' do
    visit('/')
    click_link('Bookmarks')
    expect(page).to have_content('Bookmarks')
  end
end