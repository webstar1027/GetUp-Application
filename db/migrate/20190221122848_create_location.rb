class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :placeable_id
      t.string :placeable_type

      t.timestamps
    end
  end
end
