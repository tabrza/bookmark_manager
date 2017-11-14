# As a Makers Student
# So I can know whats in the database
# I want to see a list of all the links

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end

feature 'I want to see a list of all the links' do
  scenario 'user can see a list of their link on a page' do
    Link.create(url: 'postgres://localhost/bookmark_manager_test', title: 'links')
    visit('/links')
    expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).to have_content('links')
    end
  end
end
