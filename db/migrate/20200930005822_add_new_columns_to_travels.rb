class AddNewColumnsToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :country_code, :string
    add_column :travels, :continent, :string
  end
end
