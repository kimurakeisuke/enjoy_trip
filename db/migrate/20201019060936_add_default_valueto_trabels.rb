class AddDefaultValuetoTrabels < ActiveRecord::Migration[6.0]
  def change
    change_column_default :travels, :favorites_count, from: false, to: 0
  end
end
