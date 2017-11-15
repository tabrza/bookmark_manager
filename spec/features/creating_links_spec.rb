feature 'creating links' do
  scenario 'user can add a new link' do
    create_link
    expect(page).to have_content('Google')
  end

  scenario 'user can add a url' do
    create_link
    expect(page).to have_content('google.co.uk')
  end

  scenario 'user can add a tag' do
    create_link(['search', 'engine'])
    expect(page).to have_content('search')
    expect(page).to have_content('engine')
  end
end
