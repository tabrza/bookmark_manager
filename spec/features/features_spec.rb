# As a Makers Student
# So I can know whats in the database
# I want to see a list of all the links

feature 'I want to see a list of all the links' do
  scenario 'user can see a list of their link on a page' do
    Link.create(url: 'http://localhost:9292', title: 'links')
    visit('/links')
    expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).to have_content('Tabish')
    end
  end
end
