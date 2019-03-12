class AddDateFieldsToQuest < ActiveRecord::Migration[5.2]
  def change
  	add_column :quests, :start_datetime, :datetime
  	add_column :quests, :end_datetime, :datetime
  	add_column :quests, :instructions, :text
  end
end
