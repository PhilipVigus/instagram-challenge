require 'rails_helper'

RSpec.feature 'logging in', type: :feature do
  scenario 'user successfully logs in' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teeth')
    visit '/login'
    fill_in 'Username', with: 'dracula'
    fill_in 'Password', with: 'teeth'
    click_on 'Submit'
    expect(page).to have_content 'Welcome dracula'
  end
end