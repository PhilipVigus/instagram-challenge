require 'rails_helper'

RSpec.feature 'signing up to site', type: :feature do
  scenario 'successfully sign up to the site' do
    visit signup_path
    fill_in 'Username', with: 'dracula'
    fill_in 'Email', with: 'drac@trans.com'
    fill_in 'Password', with: 'teetharepointy'
    click_on 'Submit'
    expect(page).to have_content 'Successfully signed up, please log-in'
  end

  scenario 'unsuccessfully sign up to the site' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    visit signup_path
    fill_in 'Username', with: 'dracula'
    fill_in 'Email', with: 'drac@trans.com'
    fill_in 'Password', with: 'teetharepointy'
    click_on 'Submit'
    expect(page).to have_content 'Unable to create new user'
  end
end
