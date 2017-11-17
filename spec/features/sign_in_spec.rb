feature 'User sign in' do
let!(:user) do
  User.create(
    email: 'user@example.com',
    password: '1234',
    password_confirmation: '1234'
  )
  end

  scenario 'directed to links page with welcome message upon sign in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome #{user.email}")
  end

  def sign_in(email:, password:)
    visit '/'
    within('form#sign_in') do
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Sign in'
    end
  end
end
