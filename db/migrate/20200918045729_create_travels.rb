class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.string :country, null: false
      t.string :location, null: false
      t.string :image, null: false
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
