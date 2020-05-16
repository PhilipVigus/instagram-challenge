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

    it "creates a comment" do
      login
      file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
      picture = Picture.create(user_id: User.first.id, picture: file)
      post :create, params: { picture_id: picture.id, comment: { text: "This is a comment"} }
      expect(Comment.first).to be
    end
  end
end