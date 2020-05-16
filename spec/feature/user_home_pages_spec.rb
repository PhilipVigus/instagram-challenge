require 'rails_helper'
require 'login_helper'

RSpec.feature 'user home pages', type: :feature do
  scenario 'only a users own posts show on their homepage' do
    create_user_and_login('dracula', 'drac@trans.com', 'teetharepointy')
    click_on 'Post a new picture'
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    create_user_and_login('batty', 'bat@cave.com', 'flyflyfly')
    visit "/users/#{User.last.id}"
    expect(page).to_not have_selector "img[src*=picture1]"
  end
end