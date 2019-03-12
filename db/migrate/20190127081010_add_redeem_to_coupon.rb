class AddRedeemToCoupon < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :redeem, :boolean
  end
end
