class Picture < ApplicationRecord
  validates :picture, presence: true
  has_one_attached :picture
  belongs_to :user
end
