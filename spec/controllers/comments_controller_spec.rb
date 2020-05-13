require 'rails_helper'
require 'login_helper'

RSpec.describe PicturesController, type: :controller do
  describe "POST /" do
    it "redirects back to login when you are not logged in" do
      post :create, params: nil
      expect(response).to redirect_to('/login')
    end
  end
end