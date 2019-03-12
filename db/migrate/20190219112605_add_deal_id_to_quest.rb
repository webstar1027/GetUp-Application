class AddDealIdToQuest < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :deal_id, :integer
  end
end
