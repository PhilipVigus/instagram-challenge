require 'rails_helper'
require 'login_helper'

RSpec.feature 'like pictures', type: :feature do
  before do
    create_user_and_login('dracula', 'drac@trans.com', 'teetharepointy')
    click_on 'Post a new picture'
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
  end

  scenario 'like a picture' do
    create_user_and_login('batty', 'bat@cave.com', 'flyflyfly')
    click_link(Picture.first.id.to_s)
    click_on "like_picture"
    expect(page).to have_button '1 like'
  end

  scenario 'unlike a picture' do
    create_user_and_login('batty', 'bat@cave.com', 'flyflyfly')
    click_link(Picture.first.id.to_s)
    click_on 'like_picture'
    click_on 'like_picture'
    expect(page).to have_button '0 likes'
  end

  scenario 'unable to like own picture' do
    click_link(Picture.first.id.to_s)
    expect(page).to have_button '0 likes', disabled: true
  end
end