class Picture < ApplicationRecord
  validates :picture, presence: true
  has_one_attached :picture
end