require 'rails_helper'
require 'login_helper'

RSpec.feature 'posting pictures', type: :feature do
  before do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    visit '/login'
    fill_in 'Username', with: 'dracula'
    fill_in 'Password', with: 'teetharepointy'
    click_on 'Submit'
    click_on 'Post a new picture'
  end

  scenario 'choose a picture to upload, see the picture on its page' do
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    expect(page).to have_selector "img[src*=picture1]"
  end

  scenario 'dont choose a picture, get told to choose a picture' do
    click_on 'Submit'
    expect(page).to have_content 'You must choose a picture to upload'
  end

  scenario 'post a picture with a caption' do
    attach_file('picture', 'spec/files/picture1.png')
    fill_in 'picture[caption]', with: 'An oh so hilarious picture of my favourite pet, batty the bat'
    click_on 'Submit'
    click_link(Picture.first.id.to_s)
    expect(page).to have_content('An oh so hilarious picture of my favourite pet, batty the bat')
  end

  scenario 'see the user who posted each picture' do
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    expect(page).to have_content "Posted by dracula"
  end

  scenario 'dont see a picture if you didnt post it and you havent liked it' do
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    create_user_and_login('batty', 'bat@cave.com', 'flyflyfly')
    expect(page).to_not have_content "Posted by dracula"
  end
end
