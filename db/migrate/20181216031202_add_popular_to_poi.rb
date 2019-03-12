class AddPopularToPoi < ActiveRecord::Migration[5.2]
  def change
    add_column :pois, :popular, :integer
  end
end
