feature 'add tag to bookmark' do
  scenario 'user adds a tag to a bookmark' do
    bookmark = Bookmark.create(title: 'Goal', url: 'http://www.goal.com')

    visit('/bookmarks')
    first('.bookmark').click_button('Add Tag')

    expect(current_path).to eq("/bookmarks/#{bookmark.id}/tags/new")

    fill_in('tag', with: 'football')
    click_button('Submit')

    expect(current_path).to eq('/bookmarks')
    expect(first('.bookmark')).to have_content('football')
  end
end

feature 'filter bookmarks by tag' do
  scenario 'user can see all bookmarks with a certain tag' do
    bm_one = Bookmark.create(title: 'Goal', url: 'http://www.goal.com')
    bm_two = Bookmark.create(title: 'OVO', url: 'http://www.ovosound.com')
    bm_three = Bookmark.create(title: 'XO', url: 'http://www.theweeknd.com')

    visit('/bookmarks')

    within page.find('.bookmark:nth-of-type(2)') do
      click_button('Add Tag')
    end
    fill_in('tag', with: 'toronto')
    click_button('Submit')

    within page.find('.bookmark:nth-of-type(3)') do
      click_button('Add Tag')
    end
    fill_in('tag', with: 'toronto')
    click_button('Submit')

    within page.find('.bookmark:nth-of-type(2)') do
      click_link('toronto')
    end

    expect(page).to have_link('OVO', href: 'http://www.ovosound.com')
    expect(page).to have_link('XO', href: 'http://www.theweeknd.com')
  end
end