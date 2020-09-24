class RenameFavolitesToFavorites < ActiveRecord::Migration[6.0]
  def change
    rename_table :favolites, :favorites
  end
end
