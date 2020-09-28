class RenameLocationColumnToTravels < ActiveRecord::Migration[6.0]
  def change
    rename_column :travels, :region, :region
  end
end
