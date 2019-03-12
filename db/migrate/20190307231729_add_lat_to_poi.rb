class AddLatToPoi < ActiveRecord::Migration[5.2]
  def change
    add_column :pois, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :pois, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
