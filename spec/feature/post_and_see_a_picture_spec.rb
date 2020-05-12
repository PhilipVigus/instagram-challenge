require 'rails_helper'
require 'login_helper'

RSpec.feature 'posting pictures', type: :feature do
  scenario 'choose a picture to upload, see the picture on its page' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    visit '/login'
    fill_in 'Username', with: 'dracula'
    fill_in 'Password', with: 'teetharepointy'
    click_on 'Submit'
    visit '/pictures/new'
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    expect(page).to have_selector "img[src*=picture1]"
  end

  scenario 'dont choose a picture, get told to choose a picture' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    visit '/login'
    fill_in 'Username', with: 'dracula'
    fill_in 'Password', with: 'teetharepointy'
    click_on 'Submit'
    visit new_picture_path
    click_on 'Submit'
    expect(page).to have_content 'You must choose a picture to upload'
  end
end
