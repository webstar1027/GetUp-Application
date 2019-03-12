class Landmark < ApplicationRecord
  belongs_to :poi
  has_one :cover_photo
  has_many :images
end
