require 'rails_helper'

def login
  user = User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
  session[:user_id] = user.id.to_s
end