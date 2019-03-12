class AddAddressToPoi < ActiveRecord::Migration[5.2]
  def change
    add_column :pois, :address, :text
    add_column :pois, :city, :string
    add_reference :pois, :country, foreign_key: true
  end
end
