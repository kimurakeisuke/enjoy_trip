class CreateFavolites < ActiveRecord::Migration[6.0]
  def change
    create_table :favolites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favolites, [:user_id, :travel_id], unique: true
  end
end
