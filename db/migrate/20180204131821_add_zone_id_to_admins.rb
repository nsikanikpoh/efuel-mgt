class AddZoneIdToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :zone_id, :integer
  end
end
