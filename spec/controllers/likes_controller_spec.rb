require 'rails_helper'
require 'login_helper'

RSpec.describe LikesController, type: :controller do
  describe 'POST /' do
    it 'creates a like' do
      login
      file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
      picture = Picture.create(user_id: User.first.id, picture: file)
      post :toggle, params: { picture_id: picture.id, user_id: User.first.id }
      expect(Like.first).to be
    end

    it 'removes a like if it already exists' do
      login
      file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
      picture = Picture.create(user_id: User.first.id, picture: file)
      post :toggle, params: { picture_id: picture.id, user_id: User.first.id }
      post :toggle, params: { picture_id: picture.id, user_id: User.first.id }
      expect(Like.first).to_not be
    end
  end
end