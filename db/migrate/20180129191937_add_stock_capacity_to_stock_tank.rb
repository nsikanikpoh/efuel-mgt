class AddStockCapacityToStockTank < ActiveRecord::Migration[5.1]
  def change
    add_column :stock_tanks, :stock_capacity, :float
  end
end
