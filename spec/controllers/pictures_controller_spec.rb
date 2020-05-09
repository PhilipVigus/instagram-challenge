require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    context "correct params" do
      before do
        file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
        post :create, params: { picture: { picture: file } }
      end

      it "creates a picture" do 
        expect(Picture.first).to be
      end

      it "redirects to the correct url when a picture is created" do
        expect(response).to redirect_to("/pictures/#{Picture.first.id}")
      end
    end

    context "missing params" do
      it "redirects back to pictures/new when a picture param is not specified" do
        post :create, params: { picture: { picture: nil } }
        expect(response).to redirect_to(new_picture_path)
      end
    end
  end
end
