class RemoveStockCapacityFromStockTank < ActiveRecord::Migration[5.1]
  def change
    remove_column :stock_tanks, :stock_capacity, :integer
  end
end
