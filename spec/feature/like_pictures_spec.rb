require 'rails_helper'
require 'login_helper'

RSpec.feature 'like pictures', type: :feature do
  scenario 'like a picture' do
    create_user_and_login('dracula', 'drac@trans.com', 'teetharepointy')
    click_on 'Post a new picture'
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    create_user_and_login('batty', 'bat@cave.com', 'flyflyfly')
    click_link(Picture.first.id)
    click_on "like_picture"
    expect(page).to have_button '1 like'
  end
end