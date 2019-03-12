class AddCouponClaimedToDeal < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :coupon_claimed, :integer
  end
end
