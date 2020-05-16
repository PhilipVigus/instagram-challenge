require 'rails_helper'

RSpec.feature 'restrict access if not logged in', type: :feature do
  scenario 'attempt accessing picture list when not logged in' do
    visit '/pictures'
    expect(page).to have_current_path '/login'
  end
end
