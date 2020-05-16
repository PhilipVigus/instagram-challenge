require 'rails_helper'
require 'login_helper'

RSpec.feature 'comment on pictures', type: :feature do
  scenario 'comment on a picture and see the comment on the pictures individual page' do
    User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    visit '/login'
    fill_in 'Username', with: 'dracula'
    fill_in 'Password', with: 'teetharepointy'
    click_on 'Submit'
    click_on 'Post a new picture'
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    picture = Picture.first
    fill_in "comment_#{picture.id}", with: 'Oh what a funny picture'
    click_on "submit_comment_#{picture.id}"
    expect(page).to have_content 'Oh what a funny picture'
  end
end
