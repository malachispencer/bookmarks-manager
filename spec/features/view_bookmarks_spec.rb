feature 'viewing bookmarks' do
  scenario 'visiting the bookmarks page' do
    connection = PG.connect(dbname: 'bookmarks_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.youtube.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.skysports.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.soundcloud.com');")

    visit('/')
    click_link('Bookmarks')
    
    expect(page).to have_content('http://www.youtube.com')
    expect(page).to have_content('http://www.skysports.com')
    expect(page).to have_content('http://www.soundcloud.com')
  end
end