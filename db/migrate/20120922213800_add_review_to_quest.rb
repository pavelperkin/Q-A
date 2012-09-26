class AddReviewToQuest < ActiveRecord::Migration
  def change
    add_column :quests, :review, :integer
  end
end
