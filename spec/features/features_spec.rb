# As a Makers Student
# So I can know whats in the database
# I want to see a list of all the links

feature 'I want to see a list of all the links' do
  scenario 'user can see a list of their link on a page' do
    visit('/')
    expect(page).to have_content('Tabish')
  end
end
