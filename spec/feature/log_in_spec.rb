require 'rails_helper'

RSpec.feature 'logging in', type: :feature do
  scenario 'user successfully logs in' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    visit '/login'
    fill_in 'Username', with: 'dracula'
    fill_in 'Password', with: 'teetharepointy'
    click_on 'Submit'
    expect(page).to have_content 'Welcome dracula'
  end

  scenario 'user unsuccessfully logs in' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    visit '/login'
    fill_in 'Username', with: 'dracula'
    fill_in 'Password', with: 'bitey-bitey'
    click_on 'Submit'
    expect(page).to have_content 'Unable to log in - invalid username or password'
  end
end
