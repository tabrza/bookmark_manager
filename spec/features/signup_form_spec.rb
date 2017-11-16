feature 'sign up form' do
  scenario 'when user signs in' do
    expect { sign_up('123@test.com', '12345', '12345') }.to change(User, :count).by(1)
    expect(page).to have_content('123@test.com')
    expect(page).to have_content('Welcome')
  end

  scenario 'user fills in wrong confirmation password' do
    expect { sign_up('123@test.com', '12345', '22345') }.to_not change(User, :count)
  end
end
