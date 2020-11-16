feature 'viewing bookmarks' do
  scenario 'visiting the bookmarks page' do
    visit('/')
    click_link('Bookmarks')

    test_bookmarks = [
        'http://www.youtube.com',
        'http://www.skysports.com',
        'http://www.soundcloud.com'
    ]

    test_bookmarks.each do |bookmark|
      expect(page).to have_content(bookmark)
    end
  end
end