class AddMoreFieldsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :profile_mode, :integer, default: 0
  end
end
