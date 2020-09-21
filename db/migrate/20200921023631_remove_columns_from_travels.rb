class RemoveColumnsFromTravels < ActiveRecord::Migration[6.0]
  def change
    remove_column :travels, :image, :string
    remove_column :travels, :content, :text
  end
end
