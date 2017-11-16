def create_link(tags = '')
  visit ('/links/new')
  fill_in 'url', with: 'google.co.uk'
  fill_in 'title', with: 'Google'
  fill_in('tags', with: tags) if tags.length > 0
  click_on('Submit')
end

def sign_up(email, password, confirmation_password)
  visit '/'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'confirmation_password', with: confirmation_password
  click_button 'Submit'
end
