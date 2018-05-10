class AddPumpIdToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :pump_id, :integer
  end
end
