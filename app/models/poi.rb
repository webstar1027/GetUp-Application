class Poi < ApplicationRecord
  has_one_attached :avatar
  belongs_to :country
  has_many :landmarks
  has_many_attached :images
  accepts_nested_attributes_for :landmarks, allow_destroy: true
end
