class AddTimestampsToCoupon < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :created_at, :datetime
    add_column :coupons, :updated_at, :datetime
  end
end
