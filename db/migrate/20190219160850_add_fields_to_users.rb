class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :phone_num, :string
  	add_column :users, :gender, :integer
  	add_column :users, :age, :integer
  	add_column :users, :bio, :text
  end
end
