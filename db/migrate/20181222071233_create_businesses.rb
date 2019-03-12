class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :type_of_business
      t.boolean :halal
      t.string :district
      t.text :address
      t.string :coordinate

      t.timestamps
    end
  end
end
