require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:file) { fixture_file_upload(Rails.root.join('spec/files/picture1.png'), 'image/png') }

  context 'validation' do
    it 'is not valid without a picture' do
      picture = Picture.new(picture: nil)
      expect(picture).to_not be_valid
    end
  
    it 'is valid with a picture' do
      picture = Picture.new(picture: file)
      expect(picture).to be_valid
    end
  end

  it 'attaches the picture file when you create it' do
    picture = Picture.new(picture: file)
    expect { picture.save }.to change(ActiveStorage::Attachment, :count).by 1
  end
end
