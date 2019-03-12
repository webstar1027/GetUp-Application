class Quest < ApplicationRecord
  belongs_to :deal, optional: true
  has_many :locations, as: :placeable
  has_one_attached :cover_photo

  after_create :update_deal

  validates_presence_of :title, :start_datetime, :end_datetime
  accepts_nested_attributes_for :deal, :locations, reject_if: :all_blank, allow_destroy: true

  def get_locations_name
    locations.map(&:name).join(", ")
  end

  def status
    if self.start_datetime.to_date > Date.today
      "Pending"
    elsif self.start_datetime.to_date <= Date.today && self.end_datetime.to_date >= Date.today
      "Active"
    else
      "Expired"
    end
  end

  private
    def update_deal
      deal.update(status: "Approved") if deal.present?
    end
end
