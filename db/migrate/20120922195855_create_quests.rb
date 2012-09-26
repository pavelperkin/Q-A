class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.integer :user_id
      t.string :theme
      t.string :body
      t.string :tags
      t.integer :likes
      t.integer :answers
      t.integer :comments

      t.timestamps
    end
  end
end
