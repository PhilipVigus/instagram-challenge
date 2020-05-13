require 'rails_helper'
require 'login_helper'

RSpec.describe PicturesController, type: :controller do
  describe "POST /" do
    it "redirects back to login when you are not logged in" do
      post :create, params: nil
      expect(response).to redirect_to('/login')
    end

    it "creates a comment" do
      login
      file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
      #p 'file'
      #p file
      #Picture.create()
      #p Picture.all
      #p 'here'
      #post :create, params: { picture_id: Picture.first.id, comment: { text: "This is a comment" } }
      #expect(Comment.first).to be
    end
  end
end