class AddSuperDealToDeal < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :super_deal, :boolean
  end
end
