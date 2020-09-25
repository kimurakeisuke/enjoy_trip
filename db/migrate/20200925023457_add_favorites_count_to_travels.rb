class AddFavoritesCountToTravels < ActiveRecord::Migration[6.0]
  def up
    add_column :travels, :favorites_count, :integer
    Travel.find_each { |travel| Travel.reset_counters(travel.id, :favorites_count) }
  end

  def down
    remove_column :travels, :favorites_count, :integer
  end
end
