feature 'user can sign in' do
  scenario 'directed to links page with welcome message upon sign in' do
    sign_in('123@test.com', '12345')
    expect(page).to have_content('Welcome 123@test.com')
  end
end
