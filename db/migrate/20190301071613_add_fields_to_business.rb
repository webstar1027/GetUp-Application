class AddFieldsToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :contact_email, :string
    add_column :businesses, :contact_number, :string
    add_column :businesses, :city, :string
    add_reference :businesses, :country, foreign_key: true
    add_column :businesses, :post_code, :string
    add_column :businesses, :description, :string
    add_column :businesses, :person_charge_name, :string
    add_column :businesses, :person_contact_number, :string
    add_column :businesses, :other_business, :string
    add_column :businesses, :vegan, :boolean
    add_column :businesses, :outlet, :boolean
    add_column :businesses, :social_link, :string
    add_column :businesses, :operating_hours, :string
  end
end
