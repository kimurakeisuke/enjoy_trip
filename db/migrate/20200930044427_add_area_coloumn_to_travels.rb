class AddAreaColoumnToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :area, :string
  end
end
