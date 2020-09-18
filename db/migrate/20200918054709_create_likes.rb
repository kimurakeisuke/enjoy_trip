class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :travel_id], unique: true
  end
end
