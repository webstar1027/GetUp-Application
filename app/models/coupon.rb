class Coupon < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  after_save :set_coupon_claimed
  scope :redeemed, -> { where redeem: true } 
  
  
  private
  
  def set_coupon_claimed
    self.deal.update(coupon_claimed: self.deal.coupons.count)
  end
  
end