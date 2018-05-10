class AddSlugToSalesReports < ActiveRecord::Migration[5.1]
  def change
  	add_column :sales_reports, :slug, :string
	add_index :sales_reports, :slug, unique: true
  end
end
