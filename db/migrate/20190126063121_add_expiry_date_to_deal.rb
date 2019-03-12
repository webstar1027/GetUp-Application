class AddExpiryDateToDeal < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :expiry_date, :datetime
    add_column :deals, :posted_date, :datetime
    add_column :deals, :status, :string
  end
end
