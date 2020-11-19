feature 'add bookmark' do 
  scenario 'user fills in form to add new bookmark' do
    visit('/')
    click_link('Bookmarks')
    fill_in('title', with: 'Goal')
    fill_in('url', with: 'http://www.goal.com')
    click_button('Submit')
    expect(page).to have_link('Goal', href: 'http://www.goal.com')
  end

  scenario 'user tries to submit invalid url' do
    visit('/')
    click_link('Bookmarks')
    fill_in('title', with: 'Fake News Media')
    fill_in('url', with: 'fakenewsmedia')
    click_button('Submit')
    expect(page).not_to have_link('Fake News Media', href: 'fakenewsmedia')
  end
end