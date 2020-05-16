require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:file) { fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png') }

  describe 'validations' do
    let(:user) { User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy') }
    
    it 'is valid with a picture and user' do
      picture = Picture.new(picture: file, user_id: user.id)
      expect(picture).to be_valid
    end

    it 'is invalid without a user' do
      picture = Picture.new(picture: file)
      expect(picture).to_not be_valid
    end

    it 'is invalid without a picture' do
      picture = Picture.new(user_id: user.id)
      expect(picture).to_not be_valid
    end
  end

  it 'attaches the picture file when you create it' do
    user = User.create(username: 'dracula', email: 'drac@trans.com', password: 'teetharepointy')
    picture = Picture.new(picture: file)
    picture.user = user
    expect { picture.save }.to change(ActiveStorage::Attachment, :count).by 1
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
