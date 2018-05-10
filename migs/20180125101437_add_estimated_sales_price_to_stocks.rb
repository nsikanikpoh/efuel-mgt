class AddEstimatedSalesPriceToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :estimated_sales_price, :float
  end
end
