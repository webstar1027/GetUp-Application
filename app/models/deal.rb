class Deal < ApplicationRecord
  belongs_to :user
  has_many :coupons
  #before_save :set_status
  has_many :claimed_users, through: :coupons, source: :user
  has_one :quest
  attribute :coupon_claimed, :integer, default: 0
  attribute :coupon_redeem_count, :integer, default: 0
  has_one_attached :cover_photo
  attribute :status, :string, default: "Pending"

  scope :pending, -> {where(status: "Pending")}
  scope :super_deal, -> {where(super_deal: true)}
  
  def exclusivity
    if self.exclusive?
      "Exclusive deal"
    else
      "Not exclusive"
    end
  end
  
  def coupon_counter
    if self.coupon_count == 0
      "Unlimited"
    else
      self.coupon_count
    end
  end
  
  def coupon_left
    self.coupon_count.to_i - self.coupon_claimed.to_i
  end
  
  def days_left
    unless self.coupon_expiry_date == nil
      (self.coupon_expiry_date.to_date - Date.today.to_date).to_i
    end
  end

  def active?
    expiry_date.present? ? (expiry_date.to_date >= Date.today ? "Active" : "Expired") : "Expired"
  end
  
end
