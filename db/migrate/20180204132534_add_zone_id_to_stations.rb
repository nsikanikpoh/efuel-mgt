class AddZoneIdToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :zone_id, :integer
  end
end
