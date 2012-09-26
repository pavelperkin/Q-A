class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :quest_id
      t.string :data
      t.integer :rank

      t.timestamps
    end
  end
end
