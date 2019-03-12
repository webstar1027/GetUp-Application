class Location < ApplicationRecord
  belongs_to :placeable, polymorphic: true

  validates_presence_of :name
end
