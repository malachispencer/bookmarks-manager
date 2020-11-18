feature 'viewing bookmarks' do
  scenario 'visiting the bookmarks page' do
    connection = PG.connect(dbname: 'bookmarks_manager_test')

    Bookmarks.create(title: 'YouTube', url: 'http://www.youtube.com')
    Bookmarks.create(title: 'Sky Sports', url: 'http://www.skysports.com')
    Bookmarks.create(title: 'SoundCloud', url: 'http://www.soundcloud.com')

    visit('/')
    click_link('Bookmarks')
    
    expect(page).to have_link('YouTube', href: 'http://www.youtube.com')
    expect(page).to have_link('Sky Sports', href: 'http://www.skysports.com')
    expect(page).to have_link('SoundCloud', href: 'http://www.soundcloud.com')
  end
end