require 'rails_helper'

RSpec.feature 'posting pictures', type: :feature do
  scenario 'choose a picture to upload, see the picture on its page' do
    visit '/pictures/new'
    attach_file('picture', 'spec/files/picture1.png')
    click_on 'Submit'
    expect(page).to have_selector "img[src*=picture1]"
  end
end
