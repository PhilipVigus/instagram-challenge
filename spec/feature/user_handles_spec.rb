require 'rails_helper'
require 'login_helper'

RSpec.feature 'user handles', type: :feature do
  scenario 'click on a handle and go to the user homepage' do
    create_user_and_login('dracula', 'drac@trans.com', 'teetharepointy')
    click_on 'Post a new picture'
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    click_link 'dracula'
    expect(page).to have_current_path("/users/#{User.first.id}")
  end
end