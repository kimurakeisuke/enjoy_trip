class AddColumnToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :city, :string
  end
end
