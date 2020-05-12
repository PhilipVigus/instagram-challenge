require 'rails_helper'
require 'login_helper'

RSpec.describe PicturesController, type: :controller do
  describe "GET /new " do
    it "responds with 200 when you are logged in" do
      login
      get :new
      expect(response).to have_http_status(200)
    end

    it "redirects back to login when you are not logged in" do
      get :new
      expect(response).to redirect_to('/login')
    end
  end

  describe "POST /" do
    context "correct params" do
      before do
        login
        file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
        post :create, params: { picture: { picture: file } }
      end

      it "creates a picture" do 
        expect(Picture.first).to be
      end

      it "redirects to the correct url when a picture is created" do
        expect(response).to redirect_to pictures_path
      end
    end

    context "incorrect params" do
      it "redirects back to pictures/new when a picture param is not specified" do
        login
        post :create, params: { picture: { caption: "" } }
        expect(response).to redirect_to(new_picture_path)
      end
    end

    context "unauthorised access" do
      it "redirects back to login when you are not logged in" do
        post :create, params: nil
        expect(response).to redirect_to('/login')
      end
    end
  end
end
