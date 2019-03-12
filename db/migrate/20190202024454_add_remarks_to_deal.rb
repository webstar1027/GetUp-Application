class AddRemarksToDeal < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :value_discount_remark, :integer
    add_column :deals, :percentage_discount_remark, :integer
    add_column :deals, :free_gift_remart, :string
  end
end
