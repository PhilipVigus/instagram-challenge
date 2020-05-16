require 'rails_helper'

RSpec.feature 'logging out', type: :feature do
  scenario 'user successfully logs out' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    visit '/login'
    fill_in 'Username', with: 'dracula'
    fill_in 'Password', with: 'teetharepointy'
    click_on 'Submit'
    click_on 'Log out'
    expect(page).to have_current_path '/login'
    expect(page).not_to have_content 'Welcome dracula'
  end
end
