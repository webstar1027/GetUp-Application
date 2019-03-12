class AddColumnToQuest < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :pause, :boolean, default: false
    add_column :quests, :location, :string
  end
end
