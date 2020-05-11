require 'rails_helper'

RSpec.feature 'logging in', type: :feature do
  scenario 'user successfully logs in' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teeth')
    visit 'sessions/new'
    fill_in 'Username', with: 'dracula'
    fill_in 'password', with: 'teeth'
    click_on 'Submit'
    expect(page).to have_content 'Welcome dracula'
  end
end