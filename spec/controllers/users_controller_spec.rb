require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'creates a user' do
      post :create, params: { user: { username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy' } }
      expect(User.find_by(username: 'dracula')).to be
    end
  end
end
