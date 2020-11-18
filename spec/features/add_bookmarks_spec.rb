feature 'add bookmark' do 
  scenario 'user fills in form to add new bookmark' do
    visit('/')
    click_link('Bookmarks')
    fill_in('url', with: 'http://www.goal.com')
    click_button('Submit')
    expect(page).to have_content('http://www.goal.com')
  end
end