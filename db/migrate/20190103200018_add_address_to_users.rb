class AddAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_reference :users, :country, foreign_key: true
  end
end
