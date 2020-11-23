feature 'authentication' do
  scenario 'user can sign in' do
    User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')

    visit('/')
    click_link('Sign In')
    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: 'p20201122')
    click_button('Sign In')

    expect(page).to have_content('Welcome, mjss')
  end

  scenario 'user sees error if they enter invalid email' do
    User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')

    visit('/')
    click_link('Sign In')
    fill_in('email', with: 'wrong@makers.com')
    fill_in('password', with: 'p20201122')
    click_button('Sign In')

    expect(page).to_not have_content('Welcome, mjss')
    expect(page).to have_content('Please enter correct email or password')
  end

  scenario 'users sees error if they enter incorrect password' do
    User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')

    visit('/')
    click_link('Sign In')
    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: 'wrong')
    click_button('Sign In')

    expect(page).to_not have_content('Welcome, mjss')
    expect(page).to have_content('Please enter correct email or password')
  end

  scenario 'user signs out and sees sign out message' do
    User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')

    visit('/')
    click_link('Sign In')
    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: 'p20201122')
    click_button('Sign In')
    
    click_button('Sign Out')

    expect(page).not_to have_content('Welcome, mjss')
    expect(page).to have_content('Successfully signed out')
  end
end