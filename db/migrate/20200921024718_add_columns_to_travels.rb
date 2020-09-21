class AddColumnsToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :travel_plan, :text
    add_column :travels, :travel_details_id, :integer
  end
end
