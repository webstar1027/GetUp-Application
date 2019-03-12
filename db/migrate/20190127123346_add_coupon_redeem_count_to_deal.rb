class AddCouponRedeemCountToDeal < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :coupon_redeem_count, :integer
  end
end
