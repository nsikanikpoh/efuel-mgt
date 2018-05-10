class AddAdminIdToSalesReports < ActiveRecord::Migration[5.1]
  def change
    add_column :sales_reports, :admin_id, :integer
  end
end
