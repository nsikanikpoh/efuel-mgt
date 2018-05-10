class AddPumpIdToSalesReports < ActiveRecord::Migration[5.1]
  def change
    add_column :sales_reports, :pump_id, :integer
  end
end
