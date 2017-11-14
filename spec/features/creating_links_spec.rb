feature 'creating links' do
  scenario 'user can add a new link' do
    visit ('/links/new')

    fill_in 'url', with: 'google.co.uk'
    fill_in 'title', with: 'Google'

    click_on('Submit')
    expect(page).to have_content('Google')
  end
end
