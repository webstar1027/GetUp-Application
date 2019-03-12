class AddCoordinateToPoi < ActiveRecord::Migration[5.2]
  def change
    add_column :pois, :coordinate, :string
  end
end
