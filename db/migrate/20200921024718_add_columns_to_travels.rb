class AddColumnsToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :travel_plan, :text
    add_column :travels, :travel_detail_id, :integer
  end
end
