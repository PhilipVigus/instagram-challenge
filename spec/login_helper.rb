require 'rails_helper'

def login
  user = User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
  session[:user_id] = user.id.to_s
end

def create_user_and_login(username, email, password)
  User.create(username: username, email: email, password: password)
  visit '/login'
  fill_in 'Username', with: username
  fill_in 'Password', with: password
  click_on 'Submit'
end
