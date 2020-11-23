feature 'authentication' do
  scenario 'user can sign in' do
    User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')

    visit('/')
    click_link('Sign In')
    fill_in('username', with: 'mjss')
    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: 'p20201122')
    click_button('Sign In')

    expect(page).to have_content('Hello, Malachi')
  end
end