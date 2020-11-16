feature 'viewing bookmarks' do
  scenario 'visiting the bookmarks page' do
    visit('/')
    click_link('bookmarks')
    expect(page).to have_content('bookmarks')
  end
end