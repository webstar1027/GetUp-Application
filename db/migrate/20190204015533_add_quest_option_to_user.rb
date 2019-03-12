class AddQuestOptionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :quest_option, :boolean
  end
end
