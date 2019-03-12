class CreateCoupon < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :code
      t.references :deal, foreign_key: true
    end
  end
end
