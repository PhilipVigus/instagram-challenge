require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy') }
  let(:picture) do
    file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
    picture = Picture.create(user_id: user.id, picture: file)
  end

  describe 'validations' do
    it 'is valid a user and picture' do
      like = Like.new(user_id: user.id, picture_id: picture.id)
      expect(like).to be_valid
    end

    it 'is invalid without a picture' do
      like = Like.new(user_id: user.id)
      expect(like).to_not be_valid
    end

    it 'is invalid without a user' do
      like = Like.new(picture_id: picture.id)
      expect(like).to_not be_valid
    end
  end
  
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:picture) }
  end
end
