class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :body
      t.integer :rank

      t.timestamps
    end
  end
end
