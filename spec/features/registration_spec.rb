feature 'registration'  do
  scenario 'user signs up to the site' do
    visit('/')
    click_link('Sign Up')

    fill_in('username', with: 'Malachi')
    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: 'password20201122')
    click_button('Submit')

    expect(page).to have_content('Welcome, Malachi')
  end
end