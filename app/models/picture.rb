class Picture < ApplicationRecord
  validates :picture, presence: true
  has_one_attached :picture
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
