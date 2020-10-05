class CreateTravelDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_details do |t|
      t.string :image
      t.text :content
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
