def create_link(tags = '')
    visit ('/links/new')
    fill_in 'url', with: 'google.co.uk'
    fill_in 'title', with: 'Google'
    fill_in('tags', with: tags) if tags.length > 0
    click_on('Submit')
end
