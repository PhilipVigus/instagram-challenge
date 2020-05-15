require 'rails_helper'
require 'login_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST /" do
    it "redirects back to login when you are not logged in" do
      # it doesn't matter what id's are used here.
      # they just need to be specified for the post route
      # to work at all
      post :create, params: { user_id: 1, picture_id: 1}
      expect(response).to redirect_to('/login')
    end

    xit "creates a comment" do
      login
      file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
      p 'file'
      p file
      picture = Picture.create(picture: file)
      p picture
      expect(true).to eq false
    end
  end
end