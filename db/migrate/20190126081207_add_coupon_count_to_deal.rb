class AddCouponCountToDeal < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :coupon_count, :integer
  end
end
