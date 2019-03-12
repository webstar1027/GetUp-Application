class CreatePois < ActiveRecord::Migration[5.2]
  def change
    create_table :pois do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
