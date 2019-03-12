class AddDiscountTypeToDeal < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :discount_type, :string
    add_column :deals, :exclusive, :boolean
    add_column :deals, :coupon_expiry_date, :datetime
    add_column :deals, :terms, :text
  end
end
