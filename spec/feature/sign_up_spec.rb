require 'rails_helper'

RSpec.feature 'signing up to site', type: :feature do
  scenario 'successfully sign up to the site' do
    visit '/users/new'
    fill_in 'Username', with: 'dracula'
    fill_in 'Email', with: 'drac@trans.com'
    fill_in 'Password', with: 'teeth'
    click_on 'Submit'
    expect(page).to have_content 'Successfully signed up, please log-in'
  end
end