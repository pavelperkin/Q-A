class AddQuestIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :quest_id, :integer
  end
end
