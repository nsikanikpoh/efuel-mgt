class AddCostPriceToSalesReport < ActiveRecord::Migration[5.1]
  def change
    add_column :sales_reports, :cost_price, :float
  end
end
