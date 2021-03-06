require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'logs in a user' do
      user = User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
      post :create, params: { login: { username: 'dracula', password: 'teetharepointy' } }
      expect(session[:user_id]).to eq user.id.to_s
    end
  end

  describe 'DELETE /' do
    it 'logs out a user' do
      User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
      post :create, params: { login: { username: 'dracula', password: 'teetharepointy' } }
      delete :destroy
      expect(session[:user_id]).to eq nil
    end
  end
end
