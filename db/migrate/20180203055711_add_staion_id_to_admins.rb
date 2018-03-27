class AddStaionIdToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :station_id, :integer
  end
end
