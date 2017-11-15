def create_link(tag = '')
    visit ('/links/new')
    fill_in 'url', with: 'google.co.uk'
    fill_in 'title', with: 'Google'
    fill_in('tag', with: tag) if tag.length > 0
    click_on('Submit')
end
