require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    let(:user) { User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy') }
    let(:picture) do
      file = fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png')
      picture = Picture.create(user_id: user.id, picture: file)
    end

    it 'is valid with a user and picture' do
      comment = Comment.new(user_id: user.id, picture_id: picture.id)
      expect(comment).to be_valid
    end

    it 'is invalid without a user' do
      comment = Comment.new(picture_id: picture.id)
      expect(comment).to_not be_valid
    end

    it 'is invalid without a picture' do
      comment = Comment.new(user_id: user.id)
      expect(comment).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:picture) }
  end
end
