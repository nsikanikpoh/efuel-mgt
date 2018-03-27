class AddPumpIdToTanks < ActiveRecord::Migration[5.1]
  def change
    add_column :tanks, :pump_id, :integer
  end
end
