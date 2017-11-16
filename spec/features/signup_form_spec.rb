feature 'sign up form' do
  scenario 'when user signs in' do
    visit '/'
    fill_in 'email', with: '123@test.com'
    fill_in 'password', with: '12345'
    click_button 'Submit'
    expect(page).to have_content('welcome')
    expect(page).to have_content('123@test.com')
    expect(page).to have_content('1 User')
  end
end
